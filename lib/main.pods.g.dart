// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.pods.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$HelloMessagerHash() => r'ccc8db896a56ed7d0a1c3528c50a9613b8abd9c6';

/// See also [HelloMessager].
final helloMessagerProvider =
    AutoDisposeNotifierProvider<HelloMessager, String>(
  HelloMessager.new,
  name: r'helloMessagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$HelloMessagerHash,
);
typedef HelloMessagerRef = AutoDisposeNotifierProviderRef<String>;

abstract class _$HelloMessager extends AutoDisposeNotifier<String> {
  @override
  String build();
}

String _$WordTabHash() => r'cb79ec2dad901f56e2987d1d4339852943d20484';

/// See also [WordTab].
final wordTabProvider = AutoDisposeNotifierProvider<WordTab, SayHello>(
  WordTab.new,
  name: r'wordTabProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$WordTabHash,
);
typedef WordTabRef = AutoDisposeNotifierProviderRef<SayHello>;

abstract class _$WordTab extends AutoDisposeNotifier<SayHello> {
  @override
  SayHello build();
}

String _$helloWorldHash() => r'8bbe6cff2b7b1f4e1f7be3d1820da793259f7bfc';

/// See also [helloWorld].
final helloWorldProvider = AutoDisposeProvider<String>(
  helloWorld,
  name: r'helloWorldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloWorldHash,
);
typedef HelloWorldRef = AutoDisposeProviderRef<String>;
