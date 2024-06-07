import 'package:freezed_annotation/freezed_annotation.dart';

part 'people_model.freezed.dart';
part 'people_model.g.dart';

@freezed
class People with _$People {
  const factory People({
    required String name,
    required String height,
    required String mass,
    required String gender,
    String? homeworld,
  }) = _People;

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);
}

@freezed
class PeopleModel with _$PeopleModel {
  const factory PeopleModel({
    required int count,
    String? next,
    String? previous,
    required List<People> results,
  }) = _PeopleModel;

  factory PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);
}
