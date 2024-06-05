import 'package:flutter/cupertino.dart';
import 'package:swapi_app/config/constants.dart';

class PlanetView extends StatelessWidget {
  const PlanetView({super.key});

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
        body: const Center(
          child: Text('Planet View'),
        ),
      ),
    );
  }
}
