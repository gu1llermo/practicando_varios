import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicando/presentation/providers/checkbox_provider.dart';

class CheckboxListTitleScreen extends ConsumerWidget {
  const CheckboxListTitleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final organizador = Organizador(tareas: []);
    final organizador = ref.watch(organizadorNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('CheckboxListTitleScreen')),
      body: ListView.builder(
        itemCount: organizador.tareas.length,
        itemBuilder: (context, index) {
          return organizador.tareas[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo: add tarea
          final notificador = ref.read(organizadorNotifierProvider.notifier);

          notificador.addTarea('Tarea nro: ', notificador);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
