import 'package:appez/states/weather_state.dart';
import 'package:appez/widgets/circle_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);
  final WeatherController controller = Get.put(WeatherController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appez'),
      ),
      body: Obx(() => ListView(
        children: controller.list.map((item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              CircleCheckbox(false.obs,onChanged: () => debugPrint('clicked: ${item.date}')),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.date),
                    Text(item.title,style: const TextStyle(height: 2.0))
                  ],
                ),
              ),
            ]
          ),
        )).toList(),
      ))
    );
  }
}