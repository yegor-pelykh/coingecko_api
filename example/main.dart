import 'package:coingecko_api/coingecko_api.dart';

Future<void> main() async {
  print(
    'This example demonstrates receiving OHLC data (open, high, low, close) '
    'from CoinGecko on the BTC/USD pair for the last 7 days.',
  );
  final api = CoinGeckoApi();
  print('Calling method getCoinOHLC() ...');
  final result = await api.coins.getCoinOHLC(
    id: 'bitcoin',
    vsCurrency: 'usd',
    days: 7,
  );
  if (!result.isError) {
    print('getCoinOHLC() results:');
    result.data.forEach(
      (item) => print(
          '${item.timestamp}: open = ${item.open}, high = ${item.high}, low = ${item.low}, close = ${item.close}'),
    );
    print('Test method completed successfully.');
  } else {
    print('getCoinOHLC() method returned error:');
    print('${result.errorCode}: ${result.errorMessage}');
    print('Test method failed.');
  }
}
