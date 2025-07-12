import 'package:flutter/material.dart';

import '../../presentation/screens/screens.dart';

class MenuItem {
  final String title;
  final Widget screenDestination;

  MenuItem({required this.title, required this.screenDestination});

}

final menuItems = [
  MenuItem(title: 'Reloj Screen', screenDestination: const RelojScreen()),
];