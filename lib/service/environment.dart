abstract class BaseConfig {
  String get baseUrl;
}

class DevConfig implements BaseConfig {
  @override
  String get baseUrl => 'https://api.dev.ovok.com/';

//"http://192.168.20.3:8001/api/barcode/";
//   "http://10.92.0.30:8090/api/barcode/";
}

class ProductionConfig implements BaseConfig {
  @override
  String get baseUrl => 'https://api.dev.ovok.com/';
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String dev = 'dev';
  static const String production = 'production';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.production:
        return ProductionConfig();
      default:
        return DevConfig();
    }
  }
}
