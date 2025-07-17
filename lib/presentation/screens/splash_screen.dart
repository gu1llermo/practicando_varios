import 'package:flutter/material.dart';
import 'package:practicando/presentation/screens/login_screen.dart';
import 'package:practicando/presentation/theme.dart';

import '../widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // método que se usa para ejecutar después que se reconstruye la interfaz
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // aquí uno agrega ese método que quiere ejecutar después que se reconstruye
      // ésta interfaz
    },);
    Future.delayed(const Duration(seconds: 3), () {
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen(),));
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.2,
                0.9
              ],
              colors: [
                DeliveryColors.green,
                DeliveryColors.purple,
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LogoWidget(),
            const SizedBox(
              height: 8,
            ),
             Text('DeliveryApp',
                textAlign: TextAlign.center,
                style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

