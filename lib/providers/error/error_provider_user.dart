import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_provider_user.g.dart';

@riverpod
class ErrorNotifier extends _$ErrorNotifier {
  @override
  Object? build() {
    return null;
  }

  void setError(Object error) {
    state = null;
    state = error;
  }
}
