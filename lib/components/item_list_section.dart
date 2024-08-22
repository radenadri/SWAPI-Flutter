import 'package:flutter/cupertino.dart';
import 'package:swapi/components/cupertino_list_section.dart' as extended;
import 'package:swapi/config/constants.dart';

Widget itemListSection({
  Widget? header,
  required List<Widget> items,
}) {
  return extended.CupertinoListSection(
    backgroundColor: COLOR_SECONDARY,
    separatorColor: COLOR_SECONDARY,
    decoration: const BoxDecoration(
      color: COLOR_SECONDARY,
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    header: header,
    children: items,
  );
}
