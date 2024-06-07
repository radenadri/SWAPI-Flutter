import 'package:flutter/cupertino.dart';
import 'package:swapi_app/config/constants.dart';
import 'package:swapi_app/components/cupertino_list_tile.dart' as extended;

Widget itemListTile({
  Widget? leading,
  required Widget title,
  Widget? subtitle,
  Widget? trailing,
  void Function()? onTap,
}) {
  return extended.CupertinoListTile.notched(
    leading: leading,
    title: title,
    subtitle: subtitle,
    trailing: trailing,
    onTap: () {},
    padding: const EdgeInsets.all(16.0),
    leadingSize: 50.0,
    backgroundColor: COLOR_SECONDARY,
    backgroundColorActivated: COLOR_SECONDARY,
  );
}
