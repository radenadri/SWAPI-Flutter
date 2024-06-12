import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:swapi_app/components/item_list_tile.dart';
import 'package:swapi_app/config/constants.dart';

class PlanetView extends StatefulWidget {
  const PlanetView({super.key});

  @override
  State<PlanetView> createState() => _PlanetViewState();
}

class _PlanetViewState extends State<PlanetView> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        Logger().d('reach the bottom');
      }
      if (_controller.offset <= _controller.position.minScrollExtent &&
          !_controller.position.outOfRange) {
        Logger().d('reach the top');
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
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Planets',
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
            controller: _controller,
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
