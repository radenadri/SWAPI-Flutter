import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swapi/components/avatar.dart';
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
    final character = ref.watch(characterProvider);

    return SafeArea(
      child: character.when(
        data: (character) => characterLists(
          character,
          ref,
          _controller,
        ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Text(
                'Characters (${character.count})',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
                ref.invalidate(characterProvider);
              },
              child: ListView.builder(
                controller: controller,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: character.results.length,
                itemBuilder: (context, index) {
                  final item = character.results[index];

                  if (index == character.results.length - 1) {
                    if (isLoadMore) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }

                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      leading: const Avatar(),
                      title: Text(item.name),
                      subtitle: Builder(builder: (context) {
                        var gender = item.gender;

                        if (gender == 'n/a') {
                          gender = 'Unknown';
                        } else {
                          gender = item.gender[0].toUpperCase() +
                              item.gender.substring(1);
                        }

                        return Text(gender);
                      }),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: COLOR_PRIMARY,
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
            ),
          ),
        ),
      ],
    );
  }

  Widget errorWidget(Object error) {
    Map<String, dynamic> errorMap = error as Map<String, dynamic>;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
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
      ),
    );
  }

  Widget loadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Loading'),
        ],
      ),
    );
  }
}
