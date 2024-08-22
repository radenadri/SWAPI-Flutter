import 'package:flutter/cupertino.dart';
import 'package:swapi/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
        body: Center(
          child: Column(
            children: [
              CupertinoListSection.insetGrouped(
                backgroundColor: COLOR_TRANSPARENT,
                separatorColor: COLOR_PRIMARY,
                children: [
                  CupertinoListTile.notched(
                    title: const Text('About'),
                    trailing: const Icon(
                      CupertinoIcons.chevron_right,
                      color: COLOR_PRIMARY,
                    ),
                    backgroundColor: COLOR_BLACK,
                    onTap: () {
                      // show cupertino dialog
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text(APP_NAME),
                            content: Column(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(text: 'Created by '),
                                      TextSpan(
                                        text: AUTHOR_NAME,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: '.'),
                                      TextSpan(text: '© 2024.'),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  child: const Text(
                                    AUTHOR_SITE,
                                    style: TextStyle(
                                      color: COLOR_PRIMARY,
                                    ),
                                  ),
                                  onTap: () {
                                    Uri authorUri = Uri.parse(AUTHOR_SITE);

                                    launchUrl(authorUri);
                                  },
                                )
                              ],
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  CupertinoListTile.notched(
                    title: const Text('App Version'),
                    trailing: const Text(APP_VERSION),
                    backgroundColor: COLOR_BLACK,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
