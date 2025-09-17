import 'package:flutter/material.dart';

import '../../presentation/screens/screens.dart';

class MenuItem {
  final Widget? leading;
  final String title;
  final Widget screenDestination;

  MenuItem(
      {required this.title, required this.screenDestination, this.leading});
}

final menuItems = [
  MenuItem(
    //leading: const Icon(Icons.timer),
    title: 'Botón interactivo',
    screenDestination: const BotonInteractivoScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.timer),
    title: 'Counter Transforms',
    screenDestination: const CounterTransforms(),
  ),
  MenuItem(
    //leading: const Icon(Icons.timer),
    title: 'Perspectiva 3D Screen',
    screenDestination: const Perspectiva3DScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.timer),
    title: 'Animaciones',
    screenDestination: const AnimacionesScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.timer),
    title: 'Nombres Screen',
    screenDestination: const NombresScreen(),
  ),
  
  MenuItem(
    //leading: const Icon(Icons.timer),
    title: 'Login Screen',
    screenDestination: const LoginScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.timer),
    title: 'Splash Screen',
    screenDestination: const SplashScreen(),
  ),
  MenuItem(
    leading: const Icon(Icons.timer),
    title: 'Reloj Screen',
    screenDestination: const RelojScreen(),
  ),
  MenuItem(
    leading: const Icon(Icons.check),
    title: 'CheckBox Screen',
    screenDestination: const CheckboxListTitleScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.check),
    title: 'Custom Labeled switch Screen',
    screenDestination: const CustomLabeledSwitchExampleScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.check),
    title: 'Custom Painter Screen',
    screenDestination: const CustomPainterScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.check),
    title: 'Detector gestos Screen',
    screenDestination: const DetectorGestosScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.check),
    title: 'Example Page Screen',
    screenDestination: const ExamplePageScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.check),
    title: 'Kan Screen',
    screenDestination: const KanScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.check),
    title: 'Stack Screen',
    screenDestination: const StackScreen(),
  ),
  MenuItem(
    //leading: const Icon(Icons.check),
    title: 'Switch Title Screen',
    screenDestination: const SwitchTitleScreen(),
  ),
];
