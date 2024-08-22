// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      name: json['name'] as String,
      height: json['height'] as String,
      mass: json['mass'] as String,
      hairColor: json['hair_color'] as String,
      skinColor: json['skin_color'] as String,
      eyeColor: json['eye_color'] as String,
      birthYear: json['birth_year'] as String,
      gender: json['gender'] as String,
      url: json['url'] as String,
      homeworld: json['homeworld'] as String?,
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'mass': instance.mass,
      'hair_color': instance.hairColor,
      'skin_color': instance.skinColor,
      'eye_color': instance.eyeColor,
      'birth_year': instance.birthYear,
      'gender': instance.gender,
      'url': instance.url,
      'homeworld': instance.homeworld,
    };

_$CharacterModelImpl _$$CharacterModelImplFromJson(Map<String, dynamic> json) =>
    _$CharacterModelImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CharacterModelImplToJson(
        _$CharacterModelImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
