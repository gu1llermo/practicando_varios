import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicando/shared/organizador.dart';

final organizadorNotifierProvider =
    StateNotifierProvider<OrganizadorNotifier, Organizador>(
        (ref) => OrganizadorNotifier());

class OrganizadorNotifier extends StateNotifier<Organizador> {
  OrganizadorNotifier() : super(Organizador(tareas: []));

  void addTarea(String title, StateNotifier<Organizador> stateNotifier) {
    state.addTarea(title, stateNotifier);
  }

  void deleteTarea(int id) {
    state.deleteTarea(id);
  }
}
