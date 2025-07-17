import 'package:flutter/material.dart';
import 'package:practicando/presentation/theme.dart';
import 'package:practicando/presentation/widgets/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              children: [
                const Flexible(child: HeaderWidget()),
                const Flexible(
                  flex: 3,
                  child: BodyWidget(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                        DeliveryColors.purple,
                        DeliveryColors.green,
                      ])),
                      child: Text('Login', style: textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //final widthScreen = MediaQuery.sizeOf(context).width;

    //print('debugSize widthScreen: $widthScreen');

    // final colors = Theme.of(context).colorScheme;

    // final backgroundColor = colors.surface;
    return LayoutBuilder(
      builder: (context, constraints) {
        final ancho = constraints.maxWidth;
        final altoDisponible = constraints.maxHeight;
        final bottom = altoDisponible < 100 ? altoDisponible / 2 : 50.0;
        return Stack(
          //alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              height: 200,
              //top: -200.0,
              bottom: bottom,
              left: -40.0,
              right: -40.0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(ancho / 2)),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.0,
                          0.3,
                          0.9
                        ],
                        colors: [
                          DeliveryColors.white,
                          DeliveryColors.green,
                          DeliveryColors.purple,
                        ])),
              ),
            ),
            const Align(alignment: Alignment.bottomCenter, child: LogoWidget()),
          ],
        );
      },
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    final textTheme = Theme.of(context).textTheme;
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
           SizedBox(height: 40),
          Text('Iniciar sesión', style: textTheme.displaySmall,),
          SizedBox(height: 60),
          CustomTextField(
            filled: true,
            label: Text('USERNAME', style: textTheme.labelMedium,),
            hint: Text('Username'),
            prefixIcon: Icon(Icons.person),
          ),
           SizedBox(height: 20),
          CustomTextField(
            filled: true,
            label: Text('PASSWORD', style: textTheme.labelMedium,),
            hint: Text('*********'),
            prefixIcon: Icon(Icons.lock),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.fillColor,
    this.filled,
    this.obscureText = false,
  });
  final Widget? label;
  final Widget? hint;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool? filled;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label ?? const SizedBox.shrink(),
        SizedBox(height: 4),
        DecoratedBox(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(3), boxShadow: [
            const BoxShadow(
              color: DeliveryColors.grey,
              blurRadius: 1,
            )
          ]),
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
                isDense: true,
                hint: hint,
                fillColor: fillColor,
                filled: filled,
                prefixIcon: prefixIcon,
                border: const OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ],
    );
  }
}
