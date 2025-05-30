// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bannerControllerHash() => r'8f28a410836d6317c650b3fb99e0a602693c911b';

/// See also [bannerController].
@ProviderFor(bannerController)
final bannerControllerProvider =
    AutoDisposeFutureProvider<BannerController>.internal(
  bannerController,
  name: r'bannerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bannerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BannerControllerRef = AutoDisposeFutureProviderRef<BannerController>;
String _$loadBannersHash() => r'a40707dddb3befe87f7120c47da81fe8a221ec3d';

/// See also [loadBanners].
@ProviderFor(loadBanners)
final loadBannersProvider = AutoDisposeFutureProvider<void>.internal(
  loadBanners,
  name: r'loadBannersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loadBannersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoadBannersRef = AutoDisposeFutureProviderRef<void>;
String _$bannerNotifierHash() => r'35e3fad5cbf6aef646f28ddf9953e4c884fd6e83';

/// See also [BannerNotifier].
@ProviderFor(BannerNotifier)
final bannerNotifierProvider =
    AutoDisposeNotifierProvider<BannerNotifier, List<BannerModel>>.internal(
  BannerNotifier.new,
  name: r'bannerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bannerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BannerNotifier = AutoDisposeNotifier<List<BannerModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
