
import 'package:appez/common/base_request.dart';
import 'package:appez/models/result.dart';

class WeatherAPi extends BaseRquest {
  Future<Result> getData({int current=1,int size=10,dynamic params}) async {
    return await cRequest('https://api.oick.cn/lishi/api.php');
  }
}