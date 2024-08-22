import 'package:flutter/material.dart';
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
  ConsumerState<CharacterDetailView> createState() =>
      _CharacterDetailViewState();
}

class _CharacterDetailViewState extends ConsumerState<CharacterDetailView> {
  @override
  Widget build(BuildContext context) {
    Person person = GoRouterState.of(context).extra as Person;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_SECONDARY,
        centerTitle: true,
        leading: const BackButton(color: COLOR_PRIMARY),
        title: Text(person.name, style: const TextStyle(color: COLOR_PRIMARY)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
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
                        Column(
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              color: COLOR_PRIMARY.withOpacity(0.1),
                              child: ListTile(
                                title: const Text('Name'),
                                trailing: Text(
                                  person.name,
                                  style: const TextStyle(
                                    color: COLOR_WHITE,
                                    fontSize: 14.0,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.perm_identity,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              color: COLOR_PRIMARY.withOpacity(0.1),
                              child: ListTile(
                                title: const Text('Gender'),
                                trailing: Text(
                                  person.gender == 'n/a'
                                      ? 'Unknown'
                                      : person.gender,
                                  style: const TextStyle(
                                    color: COLOR_WHITE,
                                    fontSize: 14.0,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.man,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              color: COLOR_PRIMARY.withOpacity(0.1),
                              child: ListTile(
                                title: const Text('Birth Year'),
                                trailing: Text(
                                  person.birthYear,
                                  style: const TextStyle(
                                    color: COLOR_WHITE,
                                    fontSize: 14.0,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.calendar_month,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              color: COLOR_PRIMARY.withOpacity(0.1),
                              child: ListTile(
                                title: const Text('Height'),
                                trailing: Text(
                                  person.height,
                                  style: const TextStyle(
                                    color: COLOR_WHITE,
                                    fontSize: 14.0,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.height,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              color: COLOR_PRIMARY.withOpacity(0.1),
                              child: ListTile(
                                title: const Text('Mass'),
                                trailing: Text(
                                  person.mass,
                                  style: const TextStyle(
                                    color: COLOR_WHITE,
                                    fontSize: 14.0,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.monitor_weight_rounded,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              color: COLOR_PRIMARY.withOpacity(0.1),
                              child: ListTile(
                                title: const Text('Hair Color'),
                                trailing: Text(
                                  person.hairColor,
                                  style: const TextStyle(
                                    color: COLOR_WHITE,
                                    fontSize: 14.0,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.trip_origin,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              color: COLOR_PRIMARY.withOpacity(0.1),
                              child: ListTile(
                                title: const Text('Skin Color'),
                                trailing: Text(
                                  person.skinColor,
                                  style: const TextStyle(
                                    color: COLOR_WHITE,
                                    fontSize: 14.0,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.hexagon,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              color: COLOR_PRIMARY.withOpacity(0.1),
                              child: ListTile(
                                title: const Text('Eye Color'),
                                trailing: Text(
                                  person.eyeColor,
                                  style: const TextStyle(
                                    color: COLOR_WHITE,
                                    fontSize: 14.0,
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.remove_red_eye_rounded,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
