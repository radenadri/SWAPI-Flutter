import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:swapi_app/components/item_list_tile.dart';
import 'package:swapi_app/config/constants.dart';
import 'package:swapi_app/models/people_model.dart';
import 'package:swapi_app/riverpod/people_provider.dart';

class PeopleView extends ConsumerStatefulWidget {
  const PeopleView({super.key});

  @override
  ConsumerState<PeopleView> createState() => _PeopleViewState();
}

class _PeopleViewState extends ConsumerState<PeopleView> {
  late ScrollController _controller;
  bool isLoadMore = false;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        Logger().d('reach the bottom');

        setState(() {
          isLoadMore = true;
        });

        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isLoadMore = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final people = ref.watch(peopleProvider);

    return CupertinoPageScaffold(
      child: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Peoples',
                style: TextStyle(color: COLOR_PRIMARY),
              ),
              border: null,
              backgroundColor: COLOR_SECONDARY,
            ),
          ];
        },
        body: people.when(
          data: (people) => peopleLists(people, ref),
          error: (error, stackTrace) => errorWidget(error),
          loading: () => loadingWidget(),
        ),
      ),
    );
  }

  Widget peopleLists(PeopleModel people, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              ref.invalidate(peopleProvider);
            },
            builder: (context, refreshState, pulledExtent,
                refreshTriggerPullDistance, refreshIndicatorExtent) {
              return const CupertinoActivityIndicator(
                color: COLOR_PRIMARY,
              );
            },
          ),
          SliverList.separated(
            itemCount: people.results.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 16.0,
            ),
            itemBuilder: (context, index) {
              final item = people.results[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: itemListTile(
                  leading: AspectRatio(
                    aspectRatio: 1.0,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.fill,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          return frame != null
                              ? child
                              : const CupertinoActivityIndicator(
                                  color: COLOR_PRIMARY,
                                );
                        },
                        errorBuilder: (context, object, stackTrace) {
                          return const Icon(
                            CupertinoIcons.person,
                            size: 30.0,
                          );
                        },
                      ),
                    ),
                  ),
                  title: Text(item.name),
                  subtitle: Builder(
                    builder: (context) {
                      var gender = item.gender;
                      if (gender == 'n/a') {
                        gender = 'Unknown';
                      } else {
                        gender = item.gender[0].toUpperCase() +
                            item.gender.substring(1);
                      }

                      return Text(
                        gender,
                        style: const TextStyle(color: COLOR_GREY_6),
                      );
                    },
                  ),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(CupertinoIcons.heart, size: 20.0),
                  ),
                  onTap: () {},
                ),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Builder(builder: (context) {
              if (isLoadMore) {
                return const Column(
                  children: [
                    CupertinoActivityIndicator(
                      color: COLOR_PRIMARY,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            }),
          ),
        ],
      ),
    );
  }
}

Widget errorWidget(Object error) {
  Map<String, dynamic> errorMap = error as Map<String, dynamic>;

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMap['statusCode'].toString(),
          style: const TextStyle(fontSize: 50),
        ),
        const SizedBox(height: 20.0),
        Text(errorMap['message']),
      ],
    ),
  );
}

Widget loadingWidget() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoActivityIndicator(
          color: COLOR_PRIMARY,
        ),
        SizedBox(height: 10),
        Text('Loading'),
      ],
    ),
  );
}
