// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_seed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageSeedNotifierHash() => r'3813cf2d9ef3d49643c7cfb8966d8deaba61e9ef';

/// Old way - remove it
///
/// Copied from [ImageSeedNotifier].
@ProviderFor(ImageSeedNotifier)
final imageSeedNotifierProvider =
    AutoDisposeNotifierProvider<ImageSeedNotifier, ImageSeed>.internal(
  ImageSeedNotifier.new,
  name: r'imageSeedNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageSeedNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImageSeedNotifier = AutoDisposeNotifier<ImageSeed>;
String _$seedRepoNotifierHash() => r'2b110b2390282124e012ba381e1b870eded99af9';

/// New way
///
/// Copied from [SeedRepoNotifier].
@ProviderFor(SeedRepoNotifier)
final seedRepoNotifierProvider =
    AutoDisposeNotifierProvider<SeedRepoNotifier, List<Seed<dynamic>>>.internal(
  SeedRepoNotifier.new,
  name: r'seedRepoNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$seedRepoNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SeedRepoNotifier = AutoDisposeNotifier<List<Seed<dynamic>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
