import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'image_seed_model.dart';

part 'image_seed_provider.g.dart';

@riverpod
class ImageSeedNotifier extends _$ImageSeedNotifier {
  @override
  ImageSeed build() {
    // ref.onDispose(() {
    //   print('Seed disposed');
    // });
    return ImageSeed(
        pageWidth: 1122, pageHeight: 793, shapeDelta: 300, scaleDelta: 200);
  }

  ImageSeed getSeed() {
    print("2.5 getSeed ${state.shapeDelta}");

    return state;
  }

  // void updateSeeds(
  //     int? pageWidth, int? pageHeight, int? shapeDelta, int? scaleDelta) {
  //   print("1.5 Inside updateSeed $shapeDelta");

  //   state = state.copyWith(
  //       pageWidth: pageWidth,
  //       pageHeight: pageHeight,
  //       shapeDelta: shapeDelta,
  //       scaleDelta: scaleDelta);
  //   print("1.6 Inside updateSeed ${state.shapeDelta}");
  // }

  void updateSeeds(Seed) {
    print("1.5 Inside updateSeed $shapeDelta");

    state = state.copyWith(
        pageWidth: pageWidth,
        pageHeight: pageHeight,
        shapeDelta: shapeDelta,
        scaleDelta: scaleDelta);
    print("1.6 Inside updateSeed ${state.shapeDelta}");
  }
}

class Seed<T> {
  Seed(this.seedName, this.seedValue, this.seedFunction);

  String seedName;
  T seedValue;
  Function(T value) seedFunction;

  @override
  String toString() {
    return "[$seedName]<${seedValue.runtimeType.toString()}> = $seedValue ";
  }
}

@riverpod
class SeedRepoNotifier extends _$SeedRepoNotifier {
  @override
  List<Seed<dynamic>> build() {
    return [
      Seed<int>(
        "Page Width",
        1122,
        (value) => (),
      ),
      Seed<int>(
        "Page Height",
        793,
        (value) => (),
      ),
      Seed<int>(
        "Shape Delta",
        300,
        (value) => (),
      ),
      Seed<int>(
        "Scale Delta",
        200,
        (value) => (),
      ),
    ];
  }

  @override
  String toString() {
    return state.toString();
  }
}

var livePreviewEnabledNotifierProvider = StateProvider<bool>((ref) => false);

// @riverpod
// String outputNotifier(ref) {
//   return "";
// }
