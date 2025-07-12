import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Screen')),
      body: Row(
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                
                height: 100,
                width: 100,
                color: Colors.blue,
                margin: const EdgeInsets.only(right: 20),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.green,
              ),
            ],
          ),
          Container(height: 100, width: 100, color: Colors.red),
        ],
      ),
    );
  }
}
