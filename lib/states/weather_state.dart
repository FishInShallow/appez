import 'package:appez/models/result.dart';
import 'package:get/get.dart';
import 'package:appez/models/weather.dart';
import 'package:appez/api/weather_api.dart';

class WeatherController extends GetxController {

  final list = <WeatherInfo>[].obs;
  final day = ''.obs;
  final WeatherAPi weatherAPi = WeatherAPi();
  
  Future<void> getData() async {
    Result result = await weatherAPi.getData();
    
    if(result.code == 200) {
      Weather weather = Weather.fromJson(result.data);
      day.value = weather.day;
      list.value = weather.list;
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}