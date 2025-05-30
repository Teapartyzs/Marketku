// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryControllerHash() =>
    r'356b48683dcab0f34fa02be748c4e5c07b66d2b9';

/// See also [categoryController].
@ProviderFor(categoryController)
final categoryControllerProvider =
    AutoDisposeProvider<CategoryController>.internal(
  categoryController,
  name: r'categoryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoryControllerRef = AutoDisposeProviderRef<CategoryController>;
String _$onLoadCategoryHash() => r'c0f8fc86559a414766e1fd31e67d284d89387152';

/// See also [onLoadCategory].
@ProviderFor(onLoadCategory)
final onLoadCategoryProvider = AutoDisposeFutureProvider<void>.internal(
  onLoadCategory,
  name: r'onLoadCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onLoadCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnLoadCategoryRef = AutoDisposeFutureProviderRef<void>;
String _$categoryNotifierHash() => r'a16e88eeaeaea9145f9f3ae00cb117987f0c0775';

/// See also [CategoryNotifier].
@ProviderFor(CategoryNotifier)
final categoryNotifierProvider =
    AutoDisposeNotifierProvider<CategoryNotifier, List<Category>>.internal(
  CategoryNotifier.new,
  name: r'categoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryNotifier = AutoDisposeNotifier<List<Category>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
