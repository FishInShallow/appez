class Result {
  int code;
  String? msg;
  dynamic data;

  Result({this.code=1,this.msg,this.data});

  factory Result.fromJson(Map<String,dynamic> json) {
    return Result(
      code: json['code'] ?? 0,
      msg: json['msg'],
      data: json['data'] ?? json,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': code,
    'msg': msg,
    'data': data,
  };
}