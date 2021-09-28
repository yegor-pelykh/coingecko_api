class CoinGeckoRateLimitException implements Exception {
  static const int requestPerMinute = 50;
  String errorMessage;

  CoinGeckoRateLimitException()
      : errorMessage = 'coingecko_api: $requestPerMinute requests per minute exceeded!' {}

  @override
  String toString() {
    return errorMessage;
  }
}
