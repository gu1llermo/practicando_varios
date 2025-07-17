import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OcultarBotonScroll extends StatefulWidget {
  const OcultarBotonScroll({super.key});

  @override
  State<OcultarBotonScroll> createState() => _OcultarBotonScrollState();
}

class _OcultarBotonScrollState extends State<OcultarBotonScroll> {
  bool isExpanded = true;
  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(onListen);
  }

  void onListen(){
    //print(_controller.position.userScrollDirection);
    final direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.reverse && isExpanded){
      setState(() {
        
      isExpanded = false;
      });
    } else if (direction == ScrollDirection.forward && !isExpanded){
      setState(() {
        
      isExpanded = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(onListen);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Ocultar Boton Scroll'),),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(235, 48, 40, 40),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8.0),
                child: const Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Expanded(
                        child: Text(
                      'Search conversations',
                    )),
                    Icon(Icons.more_vert),
                    SizedBox(width: 8),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  controller: _controller,
              itemCount: 25,
              itemBuilder: (context, index) {
                return _ItemView(index: index);
              },
            ))
          ],
        ),
      ),
      floatingActionButton: _CustomFAB(
        isExpanded: isExpanded,
      ),
    );
  }
}

class _ItemView extends StatelessWidget {
  const _ItemView({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[index % Colors.primaries.length];
    return ListTile(
      title: const Text('58 5698547'),
      subtitle: const Text('Hellow world, welcome to the flutter'),
      leading: CircleAvatar(
        backgroundColor: color,
        child: const Icon(Icons.person),
      ),
      trailing: const Text('30 min'),
    );
  }
}

const _duration = Duration(milliseconds: 300);
const _sizeIcon = 24.0;

class _CustomFAB extends StatelessWidget {
  const _CustomFAB({this.isExpanded = true});
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    const width = 50.0;
    const centerPosition = (width-_sizeIcon)/2;
    return AnimatedContainer(
      duration: _duration,
      width: width * (isExpanded ? 2.8 : 1),
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width / 2),
        color: Colors.blue.shade900,
      ),
      child:  Stack(
        children: [
          const Positioned(
            left: centerPosition,
            top: centerPosition,
            child: Icon(Icons.message)),
          
          Positioned(
            right: 10,
            bottom: centerPosition,
            child: AnimatedOpacity(
              duration: _duration,
              opacity: isExpanded ? 1 : 0,
              child: const Text(
                'Start chat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
