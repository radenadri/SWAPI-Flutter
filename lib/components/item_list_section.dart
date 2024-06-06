import 'package:flutter/cupertino.dart';
import 'package:swapi_app/components/cupertino_list_section.dart' as extended;
import 'package:swapi_app/config/constants.dart';

Widget itemListSection({
  Widget? header,
  required List<Widget> items,
}) {
  return extended.CupertinoListSection(
    backgroundColor: COLOR_SECONDARY,
    separatorColor: COLOR_PRIMARY,
    decoration: const BoxDecoration(
      color: COLOR_SECONDARY,
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    header: header,
    children: items,
  );
}
