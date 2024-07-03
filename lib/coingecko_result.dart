/// Wrapper class for CoinGecko API result data
class CoinGeckoResult<T> {
  /// Indicates whether there was an error executing the request
  final bool isError;

  /// Error message if an error occurred
  final String? errorMessage;

  /// Error code if an error occurred
  final int? errorCode;

  /// Result data from the API
  final T data;

  /// Constructor for CoinGeckoResult
  ///
  /// [data] - The result data from the API
  /// [isError] - Indicates if there was an error (default is false)
  /// [errorMessage] - The error message if an error occurred
  /// [errorCode] - The error code if an error occurred
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
