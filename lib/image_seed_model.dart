import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_seed_model.freezed.dart';

/// Old way - remove
@freezed
class ImageSeed with _$ImageSeed {
  factory ImageSeed(
      {int? pageWidth,
      int? pageHeight,
      int? shapeDelta,
      int? scaleDelta}) = _ImageSeed;
}
