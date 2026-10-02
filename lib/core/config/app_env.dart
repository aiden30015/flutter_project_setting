/// 실행 환경
enum Environment { dev, prod }

/// `--dart-define-from-file=env/<환경>.json` 으로 주입되는 환경 설정
class AppEnv {
  AppEnv._();

  static const String _env = String.fromEnvironment('ENV', defaultValue: 'dev');

  static final Environment environment = Environment.values.byName(_env);

  static const String baseUrl = String.fromEnvironment('BASE_URL');

  static bool get isDev => environment == Environment.dev;

  static bool get isProd => environment == Environment.prod;
}
