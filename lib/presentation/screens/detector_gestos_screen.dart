import 'package:flutter/material.dart';

class DetectorGestosScreen extends StatefulWidget {
  const DetectorGestosScreen({super.key});

  @override
  State<DetectorGestosScreen> createState() => _DetectorGestosScreenState();
}

class _DetectorGestosScreenState extends State<DetectorGestosScreen> {
  
  Offset _position = Offset.zero;
  Offset _position2 = Offset.zero;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detector de gestos Screen')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: _position.dx,
            top: _position.dy,
            child: GestureDetector(
                onPanEnd: (details) {
                  //final offset = details.globalPosition;
                  // print('onPanEnd: $offset');
                },
                onPanStart: (details) {
                  //final offset = details.globalPosition;
                  // print('onPanStart: $offset');
                },
                onPanUpdate: (details) {
                  //final offset = details.globalPosition;
                  // print('onPanUpdate: $offset');
                  setState(() {
                  _position+=details.delta;
                  print(_position);
                    
                  });
                },
                child: Align(
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                    ..rotateZ(0.1*_position.dy)
                    ,
                    child: Container(
                      height:100,
                      width: 100,
                      color: Colors.blue.shade800,
                    ),
                  ),
                )),
          ),
          Positioned(
            left: _position2.dx,
            top: _position2.dy,
            child: GestureDetector(
                onPanEnd: (details) {
                  //final offset = details.globalPosition;
                  // print('onPanEnd: $offset');
                },
                onPanStart: (details) {
                  //final offset = details.globalPosition;
                  // print('onPanStart: $offset');
                },
                onPanUpdate: (details) {
                  //final offset = details.globalPosition;
                  // print('onPanUpdate: $offset');
                  setState(() {
                  _position2+=details.delta;
                    
                  });
                },
                child: Align(
                  child: Container(
                    height:100,
                    width: 100,
                    color: Colors.red.shade800,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
