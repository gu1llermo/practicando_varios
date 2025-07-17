import 'package:flutter/material.dart';
import 'package:practicando/presentation/widgets/menu_item_card.dart';

import '../../../../core/router/menu_items.dart';


final _animaciones = [
 // MenuItem(title: 'AnimatedContainer', screenDestination: const AnimatedContainerScreen()),
];
const _title = 'Explícitas';

class Explicitas extends StatelessWidget {
  const Explicitas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title),),
      body: ListView.builder(
        itemCount: _animaciones.length ,
        itemBuilder: (context, index) {
          final menuItem = _animaciones[index];
        return MenuItemCard(menuItem: menuItem);
      },),
    );
  }
}