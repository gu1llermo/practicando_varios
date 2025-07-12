import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicando/shared/tarea.dart';

class Organizador {
  static int _id = 0;
  List<Tarea> tareas;

  Organizador({required this.tareas});

  void addTarea(String title, StateNotifier<Organizador> stateNotifier) {
    tareas.add(Tarea(
        title: title,
        id: _id++,
        onChanged: deleteTarea,
        stateNotifier: stateNotifier));
    // todo: debería actualizarce la interfaz
  }

  void deleteTarea(int id) {
    tareas.removeWhere((tarea) => tarea.id == id);
    // todo: debería actualizarce la interfaz
  }
}
