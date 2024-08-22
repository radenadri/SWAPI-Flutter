import 'package:flutter/material.dart';
import 'package:swapi/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  color: COLOR_PRIMARY.withOpacity(0.1),
                  child: ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: APP_NAME,
                        applicationIcon: Image.asset(
                          LOGO_PATH,
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        applicationVersion: APP_VERSION,
                        applicationLegalese:
                            '© 2024 radenadri. All rights reserved.',
                        children: [
                          const Text('For more about me, please visit:'),
                          GestureDetector(
                            onTap: () async {
                              if (!await launchUrl(Uri.parse(AUTHOR_SITE))) {
                                throw 'Could not launch $AUTHOR_SITE';
                              }
                            },
                            child: const Text(
                              'https://radenadri.xyz',
                              style: TextStyle(color: COLOR_PRIMARY),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  color: COLOR_PRIMARY.withOpacity(0.1),
                  child: ListTile(
                    leading: const Icon(Icons.adb_sharp),
                    title: const Text('App Version'),
                    trailing: const Text(APP_VERSION),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
