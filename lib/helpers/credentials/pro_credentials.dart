import 'package:coingecko_api/helpers/credentials/credentials.dart';

/// A class representing professional credentials for accessing the CoinGecko API.
///
/// This class extends the [Credentials] class and requires an API key for instantiation.
class ProCredentials extends Credentials {
  /// Creates an instance of [ProCredentials].
  ///
  /// The [apiKey] parameter is required and is used to authenticate API requests.
  ProCredentials({
    required super.apiKey,
  }) {}
}
