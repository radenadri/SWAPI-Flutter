// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'people_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

People _$PeopleFromJson(Map<String, dynamic> json) {
  return _People.fromJson(json);
}

/// @nodoc
mixin _$People {
  String get name => throw _privateConstructorUsedError;
  String get height => throw _privateConstructorUsedError;
  String get mass => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get homeworld => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeopleCopyWith<People> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeopleCopyWith<$Res> {
  factory $PeopleCopyWith(People value, $Res Function(People) then) =
      _$PeopleCopyWithImpl<$Res, People>;
  @useResult
  $Res call(
      {String name,
      String height,
      String mass,
      String gender,
      String? homeworld});
}

/// @nodoc
class _$PeopleCopyWithImpl<$Res, $Val extends People>
    implements $PeopleCopyWith<$Res> {
  _$PeopleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? height = null,
    Object? mass = null,
    Object? gender = null,
    Object? homeworld = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      mass: null == mass
          ? _value.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      homeworld: freezed == homeworld
          ? _value.homeworld
          : homeworld // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeopleImplCopyWith<$Res> implements $PeopleCopyWith<$Res> {
  factory _$$PeopleImplCopyWith(
          _$PeopleImpl value, $Res Function(_$PeopleImpl) then) =
      __$$PeopleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String height,
      String mass,
      String gender,
      String? homeworld});
}

/// @nodoc
class __$$PeopleImplCopyWithImpl<$Res>
    extends _$PeopleCopyWithImpl<$Res, _$PeopleImpl>
    implements _$$PeopleImplCopyWith<$Res> {
  __$$PeopleImplCopyWithImpl(
      _$PeopleImpl _value, $Res Function(_$PeopleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? height = null,
    Object? mass = null,
    Object? gender = null,
    Object? homeworld = freezed,
  }) {
    return _then(_$PeopleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      mass: null == mass
          ? _value.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      homeworld: freezed == homeworld
          ? _value.homeworld
          : homeworld // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PeopleImpl implements _People {
  const _$PeopleImpl(
      {required this.name,
      required this.height,
      required this.mass,
      required this.gender,
      this.homeworld});

  factory _$PeopleImpl.fromJson(Map<String, dynamic> json) =>
      _$$PeopleImplFromJson(json);

  @override
  final String name;
  @override
  final String height;
  @override
  final String mass;
  @override
  final String gender;
  @override
  final String? homeworld;

  @override
  String toString() {
    return 'People(name: $name, height: $height, mass: $mass, gender: $gender, homeworld: $homeworld)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeopleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.mass, mass) || other.mass == mass) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.homeworld, homeworld) ||
                other.homeworld == homeworld));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, height, mass, gender, homeworld);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeopleImplCopyWith<_$PeopleImpl> get copyWith =>
      __$$PeopleImplCopyWithImpl<_$PeopleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PeopleImplToJson(
      this,
    );
  }
}

abstract class _People implements People {
  const factory _People(
      {required final String name,
      required final String height,
      required final String mass,
      required final String gender,
      final String? homeworld}) = _$PeopleImpl;

  factory _People.fromJson(Map<String, dynamic> json) = _$PeopleImpl.fromJson;

  @override
  String get name;
  @override
  String get height;
  @override
  String get mass;
  @override
  String get gender;
  @override
  String? get homeworld;
  @override
  @JsonKey(ignore: true)
  _$$PeopleImplCopyWith<_$PeopleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PeopleModel _$PeopleModelFromJson(Map<String, dynamic> json) {
  return _PeopleModel.fromJson(json);
}

/// @nodoc
mixin _$PeopleModel {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<People> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeopleModelCopyWith<PeopleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeopleModelCopyWith<$Res> {
  factory $PeopleModelCopyWith(
          PeopleModel value, $Res Function(PeopleModel) then) =
      _$PeopleModelCopyWithImpl<$Res, PeopleModel>;
  @useResult
  $Res call({int count, String? next, String? previous, List<People> results});
}

/// @nodoc
class _$PeopleModelCopyWithImpl<$Res, $Val extends PeopleModel>
    implements $PeopleModelCopyWith<$Res> {
  _$PeopleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<People>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeopleModelImplCopyWith<$Res>
    implements $PeopleModelCopyWith<$Res> {
  factory _$$PeopleModelImplCopyWith(
          _$PeopleModelImpl value, $Res Function(_$PeopleModelImpl) then) =
      __$$PeopleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, String? next, String? previous, List<People> results});
}

/// @nodoc
class __$$PeopleModelImplCopyWithImpl<$Res>
    extends _$PeopleModelCopyWithImpl<$Res, _$PeopleModelImpl>
    implements _$$PeopleModelImplCopyWith<$Res> {
  __$$PeopleModelImplCopyWithImpl(
      _$PeopleModelImpl _value, $Res Function(_$PeopleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PeopleModelImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<People>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PeopleModelImpl implements _PeopleModel {
  const _$PeopleModelImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<People> results})
      : _results = results;

  factory _$PeopleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PeopleModelImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<People> _results;
  @override
  List<People> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PeopleModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeopleModelImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeopleModelImplCopyWith<_$PeopleModelImpl> get copyWith =>
      __$$PeopleModelImplCopyWithImpl<_$PeopleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PeopleModelImplToJson(
      this,
    );
  }
}

abstract class _PeopleModel implements PeopleModel {
  const factory _PeopleModel(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<People> results}) = _$PeopleModelImpl;

  factory _PeopleModel.fromJson(Map<String, dynamic> json) =
      _$PeopleModelImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<People> get results;
  @override
  @JsonKey(ignore: true)
  _$$PeopleModelImplCopyWith<_$PeopleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
