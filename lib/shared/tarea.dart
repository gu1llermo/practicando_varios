// class ContextTarea {
//   bool completed = false;
// }

import 'package:flutter/material.dart';

class Tarea extends StatefulWidget {
  final String title;
  final int id;
  // final ContextTarea _contextTarea = ContextTarea();
  final ValueChanged<int> onChanged;

  const Tarea(
      {super.key,
      required this.title,
      required this.id,
      required this.onChanged,
     });

  // bool get isCompleted => _contextTarea.completed;

  @override
  State<Tarea> createState() => _TareaState();
}

class _TareaState extends State<Tarea> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    final decoration =
        completed ? TextDecoration.lineThrough : TextDecoration.none;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Checkbox(
            value: completed,
            onChanged: (value) {
              setState(() {
                completed = value!;
                // widget._contextTarea.completed = completed;
              });
            },
          ),
          Expanded(
              child: InkWell(
            onTap: () {
              setState(() {
                completed = !completed;
                // widget._contextTarea.completed = completed;
              });
            },
            child: Text(
              '${widget.title}${widget.id}',
              style: TextStyle(decoration: decoration),
            ),
          )),
          IconButton(
              onPressed: () {
                // todo: al presionar aquí debería sacar a éste elemento de la lista
                // a la que pertenece

                widget.onChanged(widget.id);
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
    );
  }
}
