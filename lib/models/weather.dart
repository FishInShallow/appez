class Weather {
  int code;
  String day;
  List<WeatherInfo> list;

  Weather({this.code = 200,this.day = '',this.list = const[]});

  factory Weather.fromJson(Map<String,dynamic> json) {
    List<WeatherInfo> tList = [];
    json['result'].forEach((item) {
      tList.add(WeatherInfo.fromJson(item));
    });
    return Weather(
      code: json['code'],
      day: json['day'],
      list: tList
    );
  }
} 

class WeatherInfo {
  String date;
  String title;

  WeatherInfo({this.date = '',this.title = ''});

  factory WeatherInfo.fromJson(Map<String,dynamic> json) {
    return WeatherInfo(
      date: json['date'],
      title: json['title']
    );
  }
}