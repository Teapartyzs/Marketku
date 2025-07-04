import 'package:marketku/providers/banner/banner_provider.dart';
import 'package:marketku/providers/category/category_provider.dart';
import 'package:marketku/providers/category_sub/category_sub_provider.dart';
import 'package:marketku/providers/product/product_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final errorProvider = Provider.autoDispose<Object?>((ref) {
  final providerToWatch = [
    ref.watch(categoryNotifierProvider),
    ref.watch(productNotifierProvider),
    ref.watch(categorySubNotifierProvider),
    ref.watch(bannerNotifierProvider),
  ];

  final firstError = providerToWatch.firstWhere(
    (asyncValue) => asyncValue.hasError,
    orElse: () => const AsyncLoading(),
  );

  return firstError.error;
});
