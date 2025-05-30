// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'a0baa01b732b191855e72a1ce133aaa1a45b7429';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$onLoginHash() => r'563e7acae10aba74c84f17dd424fb1d3dbaebfc9';

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

/// See also [onLogin].
@ProviderFor(onLogin)
const onLoginProvider = OnLoginFamily();

/// See also [onLogin].
class OnLoginFamily extends Family<AsyncValue<void>> {
  /// See also [onLogin].
  const OnLoginFamily();

  /// See also [onLogin].
  OnLoginProvider call(
    String email,
    String password,
  ) {
    return OnLoginProvider(
      email,
      password,
    );
  }

  @override
  OnLoginProvider getProviderOverride(
    covariant OnLoginProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
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
  String? get name => r'onLoginProvider';
}

/// See also [onLogin].
class OnLoginProvider extends AutoDisposeFutureProvider<void> {
  /// See also [onLogin].
  OnLoginProvider(
    String email,
    String password,
  ) : this._internal(
          (ref) => onLogin(
            ref as OnLoginRef,
            email,
            password,
          ),
          from: onLoginProvider,
          name: r'onLoginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onLoginHash,
          dependencies: OnLoginFamily._dependencies,
          allTransitiveDependencies: OnLoginFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  OnLoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<void> Function(OnLoginRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OnLoginProvider._internal(
        (ref) => create(ref as OnLoginRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _OnLoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnLoginProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OnLoginRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _OnLoginProviderElement extends AutoDisposeFutureProviderElement<void>
    with OnLoginRef {
  _OnLoginProviderElement(super.provider);

  @override
  String get email => (origin as OnLoginProvider).email;
  @override
  String get password => (origin as OnLoginProvider).password;
}

String _$onRegisterHash() => r'3f585eeb27e71319898dc0a770d95bca846e239a';

/// See also [onRegister].
@ProviderFor(onRegister)
const onRegisterProvider = OnRegisterFamily();

/// See also [onRegister].
class OnRegisterFamily extends Family<AsyncValue<void>> {
  /// See also [onRegister].
  const OnRegisterFamily();

  /// See also [onRegister].
  OnRegisterProvider call(
    String fullname,
    String email,
    String password,
  ) {
    return OnRegisterProvider(
      fullname,
      email,
      password,
    );
  }

  @override
  OnRegisterProvider getProviderOverride(
    covariant OnRegisterProvider provider,
  ) {
    return call(
      provider.fullname,
      provider.email,
      provider.password,
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
  String? get name => r'onRegisterProvider';
}

/// See also [onRegister].
class OnRegisterProvider extends AutoDisposeFutureProvider<void> {
  /// See also [onRegister].
  OnRegisterProvider(
    String fullname,
    String email,
    String password,
  ) : this._internal(
          (ref) => onRegister(
            ref as OnRegisterRef,
            fullname,
            email,
            password,
          ),
          from: onRegisterProvider,
          name: r'onRegisterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onRegisterHash,
          dependencies: OnRegisterFamily._dependencies,
          allTransitiveDependencies:
              OnRegisterFamily._allTransitiveDependencies,
          fullname: fullname,
          email: email,
          password: password,
        );

  OnRegisterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fullname,
    required this.email,
    required this.password,
  }) : super.internal();

  final String fullname;
  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<void> Function(OnRegisterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OnRegisterProvider._internal(
        (ref) => create(ref as OnRegisterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fullname: fullname,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _OnRegisterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnRegisterProvider &&
        other.fullname == fullname &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fullname.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OnRegisterRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `fullname` of this provider.
  String get fullname;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _OnRegisterProviderElement extends AutoDisposeFutureProviderElement<void>
    with OnRegisterRef {
  _OnRegisterProviderElement(super.provider);

  @override
  String get fullname => (origin as OnRegisterProvider).fullname;
  @override
  String get email => (origin as OnRegisterProvider).email;
  @override
  String get password => (origin as OnRegisterProvider).password;
}

String _$onSignOutHash() => r'f422323ca0dc2672d708f04162dc2f509b2e69be';

/// See also [onSignOut].
@ProviderFor(onSignOut)
final onSignOutProvider = AutoDisposeFutureProvider<void>.internal(
  onSignOut,
  name: r'onSignOutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$onSignOutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnSignOutRef = AutoDisposeFutureProviderRef<void>;
String _$userNotifierHash() => r'49355f6602b7c55c1287ce19ea8d6a18f0caa1b4';

/// See also [UserNotifier].
@ProviderFor(UserNotifier)
final userNotifierProvider =
    AutoDisposeNotifierProvider<UserNotifier, User?>.internal(
  UserNotifier.new,
  name: r'userNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserNotifier = AutoDisposeNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
