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
String _$onLoadBannersHash() => r'935f01ab097343bb1575a9433bb963f084ba735c';

/// See also [onLoadBanners].
@ProviderFor(onLoadBanners)
final onLoadBannersProvider = AutoDisposeFutureProvider<void>.internal(
  onLoadBanners,
  name: r'onLoadBannersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onLoadBannersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnLoadBannersRef = AutoDisposeFutureProviderRef<void>;
String _$bannerNotifierHash() => r'c36861b502ed6e826616e4ddc0b6e51e65ce1e3e';

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
