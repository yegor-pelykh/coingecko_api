/// A class that holds the credentials required for API access.
class Credentials {
  /// The API key used for authentication.
  String apiKey;

  /// Creates an instance of [Credentials] with the given [apiKey].
  ///
  /// The [apiKey] parameter is required and must not be null.
  Credentials({
    required this.apiKey,
  }) {}
}
