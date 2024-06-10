import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'image_seed_model.dart';

part 'image_seed_provider.g.dart';

/// Old way - remove it
@riverpod
class ImageSeedNotifier extends _$ImageSeedNotifier {
  @override
  ImageSeed build() {
    return ImageSeed(
        pageWidth: 1122, pageHeight: 793, shapeDelta: 300, scaleDelta: 200);
  }

  ImageSeed getSeed() {
    print("2.5 getSeed ${state.shapeDelta}");

    return state;
  }

  void updateSeeds(
      int? pageWidth, int? pageHeight, int? shapeDelta, int? scaleDelta) {
    state = state.copyWith(
        pageWidth: pageWidth,
        pageHeight: pageHeight,
        shapeDelta: shapeDelta,
        scaleDelta: scaleDelta);
  }
}

// convert this to freezed probably
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

/// New way
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
      Seed<double>(
        "Shape Delta",
        300,
        (value) => (),
      ),
      Seed<double>(
        "Scale Delta",
        200,
        (value) => (),
      ),
    ];
  }

  List<Seed> getSeeds() => state;

  void updateSeeds(List<(Seed<dynamic>, dynamic)> seedResultMapping) {
    state = state.map((seed) {
      var result = seedResultMapping
          .singleWhere((mapping) => mapping.$1.seedName == seed.seedName);
      return Seed(result.$1.seedName, result.$2, (value) => null);
    }).toList();
  }

  @override
  String toString() => state.toString();
}

var livePreviewEnabledNotifierProvider = StateProvider<bool>((ref) => false);

// @riverpod
// String outputNotifier(ref) {
//   return "";
// }
