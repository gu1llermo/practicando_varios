import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/tarea.dart';

final organizadorNotifierProvider =
    StateNotifierProvider<OrganizadorNotifier, List<Tarea>>(
        (ref) => OrganizadorNotifier());

class OrganizadorNotifier extends StateNotifier<List<Tarea>> {
  OrganizadorNotifier() : super([]);

  int _id = 0;

  void addTarea(String title) {
    final tarea = Tarea(
      title: title, 
      id: _id++, 
      onChanged: deleteTarea, );
      state = [...state, tarea];
    
  }

  void deleteTarea(int id) {
    final index = state.indexWhere((tarea) => tarea.id==id);
    if (index==-1) return;// no hagas nada
    state.removeAt(index);
    state = [...state];
  }

  

  

}
