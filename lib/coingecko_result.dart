class CoinGeckoResult<T> {
  final bool isError;
  final String? errorMessage;
  final int? errorCode;
  final T data;

  CoinGeckoResult(
    this.data, {
    this.isError = false,
    this.errorMessage,
    this.errorCode,
  }) {}

  @override
  String toString() {
    return isError ? 'Error $errorCode: $errorMessage' : 'Success: $data';
  }
}
