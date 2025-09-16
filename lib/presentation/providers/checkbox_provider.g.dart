// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkbox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrganizadorNotifier)
const organizadorProvider = OrganizadorNotifierProvider._();

final class OrganizadorNotifierProvider
    extends $NotifierProvider<OrganizadorNotifier, List<Tarea>> {
  const OrganizadorNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'organizadorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$organizadorNotifierHash();

  @$internal
  @override
  OrganizadorNotifier create() => OrganizadorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Tarea> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Tarea>>(value),
    );
  }
}

String _$organizadorNotifierHash() =>
    r'683ed8f75b744c92b33c2cdd545fabbc6c9bcd67';

abstract class _$OrganizadorNotifier extends $Notifier<List<Tarea>> {
  List<Tarea> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Tarea>, List<Tarea>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Tarea>, List<Tarea>>, List<Tarea>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
