import 'package:flutter/material.dart';

import '../../core/router/menu_items.dart';
import '../widgets/menu_item_card.dart';
import 'animaciones/explicitas/explicitas.dart';
import 'animaciones/implicitas/implicitas_screen.dart';

final _elementos = [
  MenuItem(title: 'Implícitas', screenDestination: const ImplicitasScreen()),
  MenuItem(title: 'Explícitas', screenDestination: const Explicitas()),
];

class AnimacionesScreen extends StatelessWidget {
  const AnimacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones'),),
      body: ListView.builder(
        itemCount: _elementos.length,
        itemBuilder: (context, index) {
        final menuItem = _elementos[index];
        return MenuItemCard(menuItem: menuItem);
      },),
    );
  }
}