import 'package:flutter/cupertino.dart';
import 'package:swapi_app/config/constants.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Settings',
                style: TextStyle(color: COLOR_PRIMARY),
              ),
              border: null,
              backgroundColor: COLOR_SECONDARY,
            ),
          ];
        },
        body: const Center(
          child: Text('Setting View'),
        ),
      ),
    );
  }
}
