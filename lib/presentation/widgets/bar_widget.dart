import 'package:flutter/material.dart';
import 'package:practicando/presentation/widgets/app_images.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(AppImages.pizza), fit: BoxFit.cover)),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      height: 80,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.indigoAccent, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  '3.9',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.indigoAccent,
                            width: 2,
                          ),
                          const Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                StatisticsValues(
                                  value: '32',
                                  description: 'veces',
                                ),
                                StatisticsValues(
                                  value: '17',
                                  description: 'medios',
                                ),
                                StatisticsValues(
                                  value: '27',
                                  description: 'autores',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              margin: const EdgeInsets.only(left: 28),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.indigoAccent)),
                              child: Text(
                                'Kan'.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.indigoAccent)),
                                  child: Text(
                                    'Mencionado'.toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}

class StatisticsValues extends StatelessWidget {
  const StatisticsValues({
    super.key,
    required this.value,
    required this.description,
  });

  final String value;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
                color: Colors.indigoAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Text(
            description.toUpperCase(),
            style: const TextStyle(
                color: Colors.indigoAccent,
                fontWeight: FontWeight.w300,
                fontSize: 10),
          ),
        ],
      ),
    );
  }
}
