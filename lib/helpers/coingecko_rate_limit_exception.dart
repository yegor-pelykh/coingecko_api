/// Exception class to inform about exceeding the call
/// frequency allowed by the server
class CoinGeckoRateLimitException implements Exception {
  /// Maximum allowed number of calls per minute
  static const int requestPerMinute = 50;

  /// Error message
  String errorMessage;

  CoinGeckoRateLimitException()
      : errorMessage =
            'coingecko_api: $requestPerMinute requests per minute exceeded!' {}

  @override
  String toString() {
    return errorMessage;
  }
}
