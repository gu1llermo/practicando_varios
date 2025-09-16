// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nombres_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NombresNotifier)
const nombresProvider = NombresNotifierProvider._();

final class NombresNotifierProvider
    extends $NotifierProvider<NombresNotifier, UnmodifiableListView<String>> {
  const NombresNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'nombresProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$nombresNotifierHash();

  @$internal
  @override
  NombresNotifier create() => NombresNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnmodifiableListView<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnmodifiableListView<String>>(value),
    );
  }
}

String _$nombresNotifierHash() => r'52414a6ef96b919c49fd2392f72a57f3ad6e2230';

abstract class _$NombresNotifier
    extends $Notifier<UnmodifiableListView<String>> {
  UnmodifiableListView<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<UnmodifiableListView<String>, UnmodifiableListView<String>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<UnmodifiableListView<String>, UnmodifiableListView<String>>,
        UnmodifiableListView<String>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
