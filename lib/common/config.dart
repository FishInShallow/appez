

class Config { 
  // debug模式,生产环境请设置为false
  static const bool debugMode = false;
  // API基础地址
  static String debugAddress = '';
  static String productAddress = '';

  static String baseUrl = debugMode ? debugAddress : productAddress;
}