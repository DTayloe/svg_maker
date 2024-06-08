import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_seed_provider.g.dart';

class ImageSeed {
  const ImageSeed(
      this.pageWidth, this.pageHeight, this.shapeDelta, this.scaleDelta);

  final int pageWidth;
  final int pageHeight;
  final int shapeDelta;
  final int scaleDelta;
}

@riverpod
class ImageSeedNotifier extends _$ImageSeedNotifier {
  @override
  ImageSeed build() {
    // ref.onDispose(() {
    //   print('Seed disposed');
    // });
    return const ImageSeed(1122, 793, 300, 200);
  }

  ImageSeed getSeed() {
    print("2.5 getSeed ${state.shapeDelta}");

    return state;
  }

  void updateSeed(
      int pageWidth, int pageHeight, int shapeDelta, int scaleDelta) {
    print("1.5 Inside updateSeed $shapeDelta");

    state = ImageSeed(pageWidth, pageHeight, shapeDelta, scaleDelta);
    print("1.6 Inside updateSeed ${state.shapeDelta}");
  }
}

// @riverpod
// String outputNotifier(ref) {
//   return "";
// }
