import 'package:flutter/cupertino.dart';
import 'package:swapi_app/components/item_list_section.dart';
import 'package:swapi_app/components/item_list_tile.dart';
import 'package:swapi_app/config/constants.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Explore',
                style: TextStyle(color: COLOR_PRIMARY),
              ),
              border: null,
              backgroundColor: COLOR_SECONDARY,
            ),
          ];
        },
        body: CustomScrollView(
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
            SliverList(
              delegate: SliverChildListDelegate([
                // Peoples
                itemListSection(
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured peoples',
                        style: TextStyle(
                          color: COLOR_PRIMARY,
                          fontSize: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle
                              .fontSize,
                        ),
                      ),
                      // see more link button
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            color: COLOR_GREY_6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  items: [
                    itemListTile(
                      leading: AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/avatar.png',
                            fit: BoxFit.fill,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
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
                      title: const Text('Item 1'),
                      subtitle: const Text(
                        'Subtitle 1',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: COLOR_GREY_6,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),

                itemListSection(
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured films',
                        style: TextStyle(
                          color: COLOR_PRIMARY,
                          fontSize: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle
                              .fontSize,
                        ),
                      ),
                      // see more link button
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            color: COLOR_GREY_6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  items: [
                    itemListTile(
                      leading: ClipOval(
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.asset(
                            'assets/images/avatar.png',
                            fit: BoxFit.fill,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
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
                      title: const Text('Item 1'),
                      subtitle: const Text(
                        'Subtitle 1',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: COLOR_GREY_6,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),

                itemListSection(
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured planets',
                        style: TextStyle(
                          color: COLOR_PRIMARY,
                          fontSize: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle
                              .fontSize,
                        ),
                      ),
                      // see more link button
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            color: COLOR_GREY_6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  items: [
                    itemListTile(
                      leading: ClipOval(
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.asset(
                            'assets/images/avatar.png',
                            fit: BoxFit.fill,
                            frameBuilder: (context, child, frame,
                                wasSynchronouslyLoaded) {
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
                      title: const Text('Item 1'),
                      subtitle: const Text(
                        'Subtitle 1',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: COLOR_GREY_6,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
