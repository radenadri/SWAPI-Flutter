// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:swapi/config/constants.dart';
import 'package:swapi/config/di.dart';
import 'package:swapi/models/character_model.dart';

part 'character_provider.g.dart';

@Riverpod()
class Character extends _$Character {
  @override
  FutureOr<CharacterModel> build() async {
    var charModel = await getCharacters();

    return charModel;
  }

  Future<CharacterModel> getCharacters({String? nextUrl}) async {
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
        'message': 'Something went wrong, please try again',
      });
    }

    final characterModel = CharacterModel.fromJson(response.data);
    List<Person> oldPerson = state.value?.results ?? [];
    List<Person> newPerson = characterModel.results;

    state = AsyncData(
      CharacterModel(
        count: characterModel.count,
        next: characterModel.next,
        previous: characterModel.previous,
        results: [...oldPerson, ...newPerson],
      ),
    ) as AsyncValue<CharacterModel>;

    return characterModel;
  }
}
