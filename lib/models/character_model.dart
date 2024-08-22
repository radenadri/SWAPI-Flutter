import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String name,
    required String height,
    required String mass,
    @JsonKey(name: 'hair_color') required String hairColor,
    @JsonKey(name: 'skin_color') required String skinColor,
    @JsonKey(name: 'eye_color') required String eyeColor,
    @JsonKey(name: 'birth_year') required String birthYear,
    required String gender,
    required String url,
    String? homeworld,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

@freezed
class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required int count,
    String? next,
    String? previous,
    required List<Person> results,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}
