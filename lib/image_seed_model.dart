import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_seed_model.freezed.dart';

// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:freezed/builder.dart';

@freezed
class ImageSeed with _$ImageSeed {
  factory ImageSeed(
      {int? pageWidth,
      int? pageHeight,
      int? shapeDelta,
      int? scaleDelta}) = _ImageSeed;
}

// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'image_seed_model.freezed.dart';
// // part 'image_seed_model.g.dart';

// @freezed
// class MyClass with _$MyClass {
//   factory MyClass({String? a, int? b}) = _MyClass;
// }
