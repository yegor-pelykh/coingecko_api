/// CoinGecko result data wrapper
class CoinGeckoResult<T> {
  /// Indicates whether there was an error executing the request
  final bool isError;

  /// Error message
  final String? errorMessage;

  /// Error code
  final int? errorCode;

  /// Result data
  final T data;

  CoinGeckoResult(
    this.data, {
    this.isError = false,
    this.errorMessage,
    this.errorCode,
  });

  @override
  String toString() {
    return isError ? 'Error $errorCode: $errorMessage' : 'Success: $data';
  }
}
