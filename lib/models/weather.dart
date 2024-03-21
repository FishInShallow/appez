class Weather {
  String day;
  List<WeatherInfo> list;

  Weather({this.day = '',this.list = const[]});

  factory Weather.fromJson(Map<String,dynamic> json) {
    List<WeatherInfo> tList = [];
    json['result'].forEach((item) {
      tList.add(WeatherInfo.fromJson(item));
    });
    return Weather(
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