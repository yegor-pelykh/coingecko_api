import 'package:coingecko_api/helpers/credentials/credentials.dart';

/// A class representing demo credentials for accessing the CoinGecko API.
///
/// This class extends the [Credentials] class and is used to provide
/// an API key for demo purposes.
class DemoCredentials extends Credentials {
  /// Creates a new instance of [DemoCredentials].
  ///
  /// The [apiKey] parameter is required and should be a valid API key
  /// for accessing the CoinGecko API.
  DemoCredentials({
    required super.apiKey,
  }) {}
}
