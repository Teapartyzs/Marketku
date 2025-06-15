// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productControllerHash() => r'455c2c3d630f7a9cd24b702ed6487ebe26e6675c';

/// See also [productController].
@ProviderFor(productController)
final productControllerProvider =
    AutoDisposeProvider<ProductController>.internal(
  productController,
  name: r'productControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductControllerRef = AutoDisposeProviderRef<ProductController>;
String _$onLoadProductHash() => r'8ecc28c3c6c6541b1e92ef45a556feecdb37ec1b';

/// See also [onLoadProduct].
@ProviderFor(onLoadProduct)
final onLoadProductProvider = AutoDisposeFutureProvider<void>.internal(
  onLoadProduct,
  name: r'onLoadProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onLoadProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnLoadProductRef = AutoDisposeFutureProviderRef<void>;
String _$onLoadProductByCategoryHash() =>
    r'119fbfe65eb807e4c9f8ea449e465685f2f82fe3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [onLoadProductByCategory].
@ProviderFor(onLoadProductByCategory)
const onLoadProductByCategoryProvider = OnLoadProductByCategoryFamily();

/// See also [onLoadProductByCategory].
class OnLoadProductByCategoryFamily extends Family<AsyncValue<void>> {
  /// See also [onLoadProductByCategory].
  const OnLoadProductByCategoryFamily();

  /// See also [onLoadProductByCategory].
  OnLoadProductByCategoryProvider call(
    String categoryName,
  ) {
    return OnLoadProductByCategoryProvider(
      categoryName,
    );
  }

  @override
  OnLoadProductByCategoryProvider getProviderOverride(
    covariant OnLoadProductByCategoryProvider provider,
  ) {
    return call(
      provider.categoryName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'onLoadProductByCategoryProvider';
}

/// See also [onLoadProductByCategory].
class OnLoadProductByCategoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [onLoadProductByCategory].
  OnLoadProductByCategoryProvider(
    String categoryName,
  ) : this._internal(
          (ref) => onLoadProductByCategory(
            ref as OnLoadProductByCategoryRef,
            categoryName,
          ),
          from: onLoadProductByCategoryProvider,
          name: r'onLoadProductByCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onLoadProductByCategoryHash,
          dependencies: OnLoadProductByCategoryFamily._dependencies,
          allTransitiveDependencies:
              OnLoadProductByCategoryFamily._allTransitiveDependencies,
          categoryName: categoryName,
        );

  OnLoadProductByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryName,
  }) : super.internal();

  final String categoryName;

  @override
  Override overrideWith(
    FutureOr<void> Function(OnLoadProductByCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OnLoadProductByCategoryProvider._internal(
        (ref) => create(ref as OnLoadProductByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryName: categoryName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _OnLoadProductByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnLoadProductByCategoryProvider &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OnLoadProductByCategoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `categoryName` of this provider.
  String get categoryName;
}

class _OnLoadProductByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with OnLoadProductByCategoryRef {
  _OnLoadProductByCategoryProviderElement(super.provider);

  @override
  String get categoryName =>
      (origin as OnLoadProductByCategoryProvider).categoryName;
}

String _$productNotifierHash() => r'61bc039a281a9c4639e90aa66c8c935ef0da0569';

/// See also [ProductNotifier].
@ProviderFor(ProductNotifier)
final productNotifierProvider =
    AutoDisposeNotifierProvider<ProductNotifier, List<Product>>.internal(
  ProductNotifier.new,
  name: r'productNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductNotifier = AutoDisposeNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
