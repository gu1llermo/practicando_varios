import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchTitleScreen extends StatelessWidget {
  const SwitchTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SwitchTitleScreen')),
      body: const SwitchTitleView(),
    );
  }
}

class SwitchTitleView extends StatefulWidget {
  const SwitchTitleView({super.key});

  @override
  State<SwitchTitleView> createState() => _SwitchTitleViewState();
}

class _SwitchTitleViewState extends State<SwitchTitleView> {
  bool sw1 = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    var secondary = sw1
        ? const Icon(
            Icons.light_mode,
            color: Colors.green,
            size: 40,
          )
        : const Icon(
            Icons.light_mode_outlined,
            color: Colors.black,
            size: 40,
          );

    return Column(
      children: [
        SwitchListTile(
          secondary: secondary,
          value: sw1,
          onChanged: (value) {
            setState(() {
              sw1 = value;
            });
          },
        ),
      ],
    );
  }
}
