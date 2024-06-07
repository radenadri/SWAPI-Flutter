import 'package:flutter/cupertino.dart';
import 'package:swapi_app/components/item_list_tile.dart';
import 'package:swapi_app/config/constants.dart';

class FilmView extends StatelessWidget {
  const FilmView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Films',
                style: TextStyle(color: COLOR_PRIMARY),
              ),
              border: null,
              backgroundColor: COLOR_SECONDARY,
            ),
          ];
        },
        body: Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 2));
                  return;
                },
                builder: (context, refreshState, pulledExtent,
                    refreshTriggerPullDistance, refreshIndicatorExtent) {
                  return const CupertinoActivityIndicator(
                    color: COLOR_PRIMARY,
                  );
                },
              ),
              SliverList.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16.0,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: itemListTile(
                      leading: AspectRatio(
                        aspectRatio: 1.0,
                        child: Image.network(
                          'https://via.placeholder.com/100',
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
                      title: const Text('Item 1'),
                      subtitle: const Text(
                        'Subtitle 1',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: COLOR_GREY_6,
                        ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
