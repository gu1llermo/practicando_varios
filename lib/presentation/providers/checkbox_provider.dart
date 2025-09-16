import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/tarea.dart';


part 'checkbox_provider.g.dart';
// final organizadorNotifierProvider =
//     StateNotifierProvider<OrganizadorNotifier, List<Tarea>>(
//         (ref) => OrganizadorNotifier());

@Riverpod()
class OrganizadorNotifier extends _$OrganizadorNotifier {
  @override
  List<Tarea> build()=> const [];

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
