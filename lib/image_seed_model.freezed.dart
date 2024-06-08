// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_seed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageSeed {
  int? get pageWidth => throw _privateConstructorUsedError;
  int? get pageHeight => throw _privateConstructorUsedError;
  int? get shapeDelta => throw _privateConstructorUsedError;
  int? get scaleDelta => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageSeedCopyWith<ImageSeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSeedCopyWith<$Res> {
  factory $ImageSeedCopyWith(ImageSeed value, $Res Function(ImageSeed) then) =
      _$ImageSeedCopyWithImpl<$Res, ImageSeed>;
  @useResult
  $Res call(
      {int? pageWidth, int? pageHeight, int? shapeDelta, int? scaleDelta});
}

/// @nodoc
class _$ImageSeedCopyWithImpl<$Res, $Val extends ImageSeed>
    implements $ImageSeedCopyWith<$Res> {
  _$ImageSeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageWidth = freezed,
    Object? pageHeight = freezed,
    Object? shapeDelta = freezed,
    Object? scaleDelta = freezed,
  }) {
    return _then(_value.copyWith(
      pageWidth: freezed == pageWidth
          ? _value.pageWidth
          : pageWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      pageHeight: freezed == pageHeight
          ? _value.pageHeight
          : pageHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      shapeDelta: freezed == shapeDelta
          ? _value.shapeDelta
          : shapeDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      scaleDelta: freezed == scaleDelta
          ? _value.scaleDelta
          : scaleDelta // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageSeedImplCopyWith<$Res>
    implements $ImageSeedCopyWith<$Res> {
  factory _$$ImageSeedImplCopyWith(
          _$ImageSeedImpl value, $Res Function(_$ImageSeedImpl) then) =
      __$$ImageSeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? pageWidth, int? pageHeight, int? shapeDelta, int? scaleDelta});
}

/// @nodoc
class __$$ImageSeedImplCopyWithImpl<$Res>
    extends _$ImageSeedCopyWithImpl<$Res, _$ImageSeedImpl>
    implements _$$ImageSeedImplCopyWith<$Res> {
  __$$ImageSeedImplCopyWithImpl(
      _$ImageSeedImpl _value, $Res Function(_$ImageSeedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageWidth = freezed,
    Object? pageHeight = freezed,
    Object? shapeDelta = freezed,
    Object? scaleDelta = freezed,
  }) {
    return _then(_$ImageSeedImpl(
      pageWidth: freezed == pageWidth
          ? _value.pageWidth
          : pageWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      pageHeight: freezed == pageHeight
          ? _value.pageHeight
          : pageHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      shapeDelta: freezed == shapeDelta
          ? _value.shapeDelta
          : shapeDelta // ignore: cast_nullable_to_non_nullable
              as int?,
      scaleDelta: freezed == scaleDelta
          ? _value.scaleDelta
          : scaleDelta // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ImageSeedImpl with DiagnosticableTreeMixin implements _ImageSeed {
  _$ImageSeedImpl(
      {this.pageWidth, this.pageHeight, this.shapeDelta, this.scaleDelta});

  @override
  final int? pageWidth;
  @override
  final int? pageHeight;
  @override
  final int? shapeDelta;
  @override
  final int? scaleDelta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageSeed(pageWidth: $pageWidth, pageHeight: $pageHeight, shapeDelta: $shapeDelta, scaleDelta: $scaleDelta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageSeed'))
      ..add(DiagnosticsProperty('pageWidth', pageWidth))
      ..add(DiagnosticsProperty('pageHeight', pageHeight))
      ..add(DiagnosticsProperty('shapeDelta', shapeDelta))
      ..add(DiagnosticsProperty('scaleDelta', scaleDelta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageSeedImpl &&
            (identical(other.pageWidth, pageWidth) ||
                other.pageWidth == pageWidth) &&
            (identical(other.pageHeight, pageHeight) ||
                other.pageHeight == pageHeight) &&
            (identical(other.shapeDelta, shapeDelta) ||
                other.shapeDelta == shapeDelta) &&
            (identical(other.scaleDelta, scaleDelta) ||
                other.scaleDelta == scaleDelta));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pageWidth, pageHeight, shapeDelta, scaleDelta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageSeedImplCopyWith<_$ImageSeedImpl> get copyWith =>
      __$$ImageSeedImplCopyWithImpl<_$ImageSeedImpl>(this, _$identity);
}

abstract class _ImageSeed implements ImageSeed {
  factory _ImageSeed(
      {final int? pageWidth,
      final int? pageHeight,
      final int? shapeDelta,
      final int? scaleDelta}) = _$ImageSeedImpl;

  @override
  int? get pageWidth;
  @override
  int? get pageHeight;
  @override
  int? get shapeDelta;
  @override
  int? get scaleDelta;
  @override
  @JsonKey(ignore: true)
  _$$ImageSeedImplCopyWith<_$ImageSeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
