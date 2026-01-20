enum Environment { dev, staging, production }

class Env {
  static Environment current = Environment.dev;

  static bool get isDev => current == Environment.dev;
  static bool get isProd => current == Environment.production;
}