import 'package:flutter/material.dart';

const backgroundColors = [
  Color(0XFF8122BF),
  Color(0XFFCA32F5),
  Color(0XFFF2B634),
];

class SocialShareChallenge extends StatefulWidget {
  const SocialShareChallenge({super.key});

  @override
  State<SocialShareChallenge> createState() => _SocialShareChallengeState();
}

class _SocialShareChallengeState extends State<SocialShareChallenge> {
  bool showSocialButton = false;
  double primaryDy = 0.0;
  // Truco para determinar el ancho de un widget
  double width = 0.0;
  final _buttonsKey = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(() {
          // listo y asi podemos obtener el taaño de un widget xD
          width = _buttonsKey.currentContext?.size?.width ?? 0.0;
        });
      },
    );
    super.initState();
  }

  void onPressedShareButton() {
    if (primaryDy == 0) {
      primaryDy = 0.43;
    } else {
      primaryDy = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final invierte = primaryDy == 0.0;
    const begin = Alignment.bottomLeft;
    const end = Alignment.topRight;

    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: invierte ? end : begin,
              end: invierte ? begin : end,
              colors: backgroundColors)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: GestureDetector(
            onTap: onPressedShareButton,
            child: Container(
              height: 120,
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SecondarySocialButton(
                    dy: -primaryDy,
                    buttonKey: _buttonsKey,
                  ),
                  PrimarySocialButton(
                    dy: primaryDy,
                    onPressed: onPressedShareButton,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondarySocialButton extends StatelessWidget {
  const SecondarySocialButton({super.key, required this.dy, this.buttonKey});
  final double dy;
  final Key? buttonKey;

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[0];
    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      offset: Offset(0.0, dy),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(offset: Offset(1, 1), blurRadius: 4, color: Colors.white)
            ]
            ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          key: buttonKey,
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.social_distance)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.next_plan)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shape_line)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          ],
        ),
      ),
    );
  }
}

class PrimarySocialButton extends StatelessWidget {
  const PrimarySocialButton({super.key, this.onPressed, required this.dy});
  final void Function()? onPressed;
  final double dy;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 300),
      offset: Offset(0.0, dy),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black,
            boxShadow: const [
              BoxShadow(offset: Offset(1, 1), blurRadius: 4)
            ]),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 65, vertical: 16),
          child: Text(
            'S H A R E',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
