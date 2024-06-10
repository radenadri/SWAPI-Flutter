// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swapi_app/config/constants.dart';
import 'package:swapi_app/config/di.dart';
import 'package:swapi_app/models/people_model.dart';

part 'people_provider.g.dart';

@Riverpod()
class People extends _$People {
  @override
  FutureOr<PeopleModel> build() async {
    var peopleModel = await getPeople();

    return peopleModel;
  }

  Future<PeopleModel> getPeople({String? nextUrl}) async {
    final dio = ref.watch(dioProvider);

    final response = await dio.get(
      nextUrl ?? '$SWAPI_URL/people',
      options: Options(
        validateStatus: (status) => true,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode != 200) {
      return Future.error({
        'success': false,
        'statusCode': response.statusCode,
        'message': 'Something when wrong, please try again',
      });
    }

    /*
      for (var people in response.data['results'] as List) {
        if (people['homeworld'] != null) {
          final homeworld = await dio.get(
            people['homeworld'],
            options: Options(
              validateStatus: (status) => true,
              headers: {'Content-Type': 'application/json'},
            ),
          );

          if (homeworld.statusCode != 200 || homeworld.data == null) {
            people['homeworld'] = 'unknown';

            return Future.error({
              'success': false,
              'statusCode': homeworld.statusCode,
              'message': 'Something when wrong, please try again',
            });
          }

          people['homeworld'] = homeworld.data['name'] ?? 'unknown';
        }
      }
    */

    final people = PeopleModel.fromJson(response.data);
    List<Person> oldPeople = state.value?.results ?? [];
    List<Person> newPeople = people.results;

    state = AsyncData(PeopleModel(
      count: people.count,
      next: people.next,
      previous: people.previous,
      results: [...oldPeople, ...newPeople],
    )) as AsyncValue<PeopleModel>;

    return people;
  }
}
