import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/nombres_provider.dart';

class NombresScreen extends ConsumerWidget {
  const NombresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nombres = ref.watch(nombresProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Nombres Screen'),),

      body: ListView.builder(
        itemCount: nombres.length,
        itemBuilder: (context, index) {
        final nombre = nombres[index];
        return ListTile(title: Row(
          children: [
            Expanded(child: Text(nombre)),
            IconButton(onPressed: () {
              ref.read(nombresProvider.notifier).deleteNombre(nombre);
            }, icon: const Icon(Icons.delete_forever, color: Colors.red,))
          ],
        ),);
      },),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(nombresProvider.notifier).addNombre();
        },),
        
    );
  }
}