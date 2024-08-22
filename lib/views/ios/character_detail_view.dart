import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swapi/components/avatar.dart';
import 'package:swapi/config/constants.dart';
import 'package:swapi/models/character_model.dart';

class CharacterDetailView extends ConsumerStatefulWidget {
  const CharacterDetailView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CharacterDetailViewState();
}

class _CharacterDetailViewState extends ConsumerState<CharacterDetailView> {
  @override
  Widget build(BuildContext context) {
    Person person = GoRouterState.of(context).extra as Person;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: COLOR_SECONDARY,
        border: null,
        middle: Text(
          person.name,
          style: const TextStyle(color: COLOR_PRIMARY),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Avatar(),
                ),
                const SizedBox(height: 20.0),
                CupertinoListSection.insetGrouped(
                  backgroundColor: COLOR_TRANSPARENT,
                  separatorColor: COLOR_PRIMARY,
                  children: [
                    CupertinoListTile.notched(
                      title: const Text('Name'),
                      additionalInfo: Text(
                        person.name,
                        style: const TextStyle(color: COLOR_WHITE),
                      ),
                      backgroundColor: COLOR_BLACK,
                      leading: const Icon(
                        CupertinoIcons.person_alt,
                        size: 20.0,
                      ),
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Gender'),
                      additionalInfo: Text(
                        person.gender == 'n/a' ? 'Unknown' : person.gender,
                        style: const TextStyle(color: COLOR_WHITE),
                      ),
                      backgroundColor: COLOR_BLACK,
                      leading: const Icon(
                        CupertinoIcons.capsule_fill,
                        size: 20.0,
                      ),
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Birth Year'),
                      additionalInfo: Text(
                        person.birthYear,
                        style: const TextStyle(color: COLOR_WHITE),
                      ),
                      backgroundColor: COLOR_BLACK,
                      leading: const Icon(
                        CupertinoIcons.calendar,
                        size: 20.0,
                      ),
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Height'),
                      additionalInfo: Text(
                        person.height,
                        style: const TextStyle(color: COLOR_WHITE),
                      ),
                      backgroundColor: COLOR_BLACK,
                      leading: const Icon(
                        CupertinoIcons.resize_v,
                        size: 20.0,
                      ),
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Mass'),
                      additionalInfo: Text(
                        person.mass,
                        style: const TextStyle(color: COLOR_WHITE),
                      ),
                      backgroundColor: COLOR_BLACK,
                      leading: const Icon(
                        CupertinoIcons.resize_h,
                        size: 20.0,
                      ),
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Hair Color'),
                      additionalInfo: Text(
                        person.hairColor,
                        style: const TextStyle(color: COLOR_WHITE),
                      ),
                      backgroundColor: COLOR_BLACK,
                      leading: const Icon(
                        CupertinoIcons.triangle_fill,
                        size: 20.0,
                      ),
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Skin Color'),
                      additionalInfo: Text(
                        person.skinColor,
                        style: const TextStyle(color: COLOR_WHITE),
                      ),
                      backgroundColor: COLOR_BLACK,
                      leading: const Icon(
                        CupertinoIcons.hexagon_fill,
                        size: 20.0,
                      ),
                    ),
                    CupertinoListTile.notched(
                      title: const Text('Eye Color'),
                      additionalInfo: Text(
                        person.eyeColor,
                        style: const TextStyle(color: COLOR_WHITE),
                      ),
                      backgroundColor: COLOR_BLACK,
                      leading: const Icon(
                        CupertinoIcons.eye,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
