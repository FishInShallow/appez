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
      body: Obx(() => ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (BuildContext context, int index) => Row(
          children: [
            CircleCheckbox(false.obs),
            Expanded(
              child: Column(
                children: [
                  Text(controller.list[index].date),
                  Text(controller.list[index].title,style: const TextStyle(height: 2.0))
                ],
              ),
            ),
          ],
        )
      ))
    );
  }
}