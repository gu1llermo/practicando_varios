import 'package:flutter/material.dart';
import 'package:practicando/presentation/widgets/menu_item_card.dart';

import '../../../../core/router/menu_items.dart';
import 'implicitas.dart';

final _animaciones = [
  MenuItem(title: 'AnimatedContainer', screenDestination: const AnimatedContainerScreen()),
  MenuItem(title: 'Tween Animation', screenDestination: const TweenAnimationsScreen()),
  MenuItem(title: 'Social Share', screenDestination: const SocialShareChallenge()),
  MenuItem(title: 'Ocultar botón', screenDestination: const OcultarBotonScroll()),
];
const _title = 'Implícitas';

class ImplicitasScreen extends StatelessWidget {
  const ImplicitasScreen({super.key});

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