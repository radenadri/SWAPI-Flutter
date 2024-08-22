import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swapi/components/avatar.dart';
import 'package:swapi/components/item_list_tile.dart';
import 'package:swapi/config/constants.dart';
import 'package:swapi/models/character_model.dart';
import 'package:swapi/riverpod/character_provider.dart';

class CharacterView extends ConsumerStatefulWidget {
  const CharacterView({super.key});

  @override
  ConsumerState<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends ConsumerState<CharacterView> {
  late ScrollController _controller;
  bool isLoadMore = false;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() async {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        final people = ref.watch(characterProvider);

        String? next = people.asData?.value.next;

        setState(() {
          isLoadMore = true;
        });

        if (next != null && isLoadMore) {
          await ref
              .read(characterProvider.notifier)
              .getCharacters(nextUrl: next);
        }

        setState(() {
          isLoadMore = false;
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
    final people = ref.watch(characterProvider);

    return CupertinoPageScaffold(
      child: people.when(
        data: (people) => characterLists(people, ref, _controller),
        error: (error, stackTrace) => errorWidget(error),
        loading: () => loadingWidget(),
      ),
    );
  }

  Widget characterLists(
    CharacterModel character,
    WidgetRef ref,
    ScrollController controller,
  ) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(
            'Characters (${character.count})',
            style: const TextStyle(color: COLOR_PRIMARY),
          ),
          border: null,
          backgroundColor: COLOR_SECONDARY,
        ),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
            ref.invalidate(characterProvider);
          },
          builder: (
            context,
            refreshState,
            pulledExtent,
            refreshTriggerPullDistance,
            refreshIndicatorExtent,
          ) {
            return const CupertinoActivityIndicator(
              color: COLOR_PRIMARY,
            );
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16.0,
          ),
        ),
        SliverList.separated(
          itemCount: character.results.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 16.0,
          ),
          itemBuilder: (context, index) {
            final item = character.results[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: itemListTile(
                leading: const Avatar(),
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
                onTap: () {
                  List<String> charArray = item.url.split('/');
                  String id = charArray[charArray.length - 2];

                  context.pushNamed(
                    'character_detail',
                    pathParameters: {'id': id},
                    extra: item,
                  );
                },
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
