import 'package:coingecko_api/helpers/credentials/credentials.dart';
import 'package:dio/dio.dart';

class Client {
  Credentials? credentials;
  Dio dio;

  Client({
    required this.credentials,
    required this.dio,
  }) {}
}
