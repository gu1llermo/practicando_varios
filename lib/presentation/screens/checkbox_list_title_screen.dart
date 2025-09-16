import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicando/presentation/providers/checkbox_provider.dart';


class CheckboxListTitleScreen extends ConsumerWidget {
  const CheckboxListTitleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final organizador = Organizador(tareas: []);
    final tareas = ref.watch(organizadorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('CheckboxListTitleScreen')),
      body: ListView.builder(
        itemCount: tareas.length,
        itemBuilder: (context, index) {
          return tareas[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo: add tarea
          final notificador = ref.read(organizadorProvider.notifier);

          notificador.addTarea('Tarea nro: ');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
