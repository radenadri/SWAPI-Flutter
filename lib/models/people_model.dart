import 'package:freezed_annotation/freezed_annotation.dart';

part 'people_model.freezed.dart';
part 'people_model.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String name,
    required String height,
    required String mass,
    required String gender,
    required String url,
    String? homeworld,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

@freezed
class PeopleModel with _$PeopleModel {
  const factory PeopleModel({
    required int count,
    String? next,
    String? previous,
    required List<Person> results,
  }) = _PeopleModel;

  factory PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);
}
