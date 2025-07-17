import 'dart:collection';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nombres_provider.g.dart';

@Riverpod()
class NombresNotifier extends _$NombresNotifier {
  
  final List<String> _nombres = [];
  int _id = 0;

  @override
  UnmodifiableListView<String> build() => UnmodifiableListView(_nombres);

  void addNombre(){
    _nombres.add('Nombre ${_id++}');
    state = UnmodifiableListView(_nombres);
  }

  void deleteNombre(String nombre){
    _nombres.remove(nombre);
    state = UnmodifiableListView(_nombres);
  }

}