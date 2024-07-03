import 'package:coingecko_api/helpers/credentials/credentials.dart';
import 'package:dio/dio.dart';

/// A client class that handles API requests using Dio and credentials.
class Client {
  /// The credentials used for authentication.
  Credentials? credentials;

  /// The Dio instance used for making HTTP requests.
  Dio dio;

  /// Constructs a [Client] instance with the given [credentials] and [dio].
  ///
  /// [credentials] - The credentials used for authentication.
  /// [dio] - The Dio instance used for making HTTP requests.
  Client({
    required this.credentials,
    required this.dio,
  }) {}
}
