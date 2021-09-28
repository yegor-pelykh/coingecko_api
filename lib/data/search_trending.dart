import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

class SearchTrendingCoin {
  final String id;
  final int coinId;
  final String name;
  final String symbol;
  final int marketCapRank;
  final String thumb;
  final String small;
  final String large;
  final String slug;
  final double priceBtc;
  final int score;

  SearchTrendingCoin.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toNotNullableString(json['id'], ''),
        this.coinId = Convert.toInt(json['coin_id']) ?? 0,
        this.name = Convert.toNotNullableString(json['name'], ''),
        this.symbol = Convert.toNotNullableString(json['symbol'], ''),
        this.marketCapRank = Convert.toInt(json['market_cap_rank']) ?? 0,
        this.thumb = Convert.toNotNullableString(json['thumb'], ''),
        this.small = Convert.toNotNullableString(json['small'], ''),
        this.large = Convert.toNotNullableString(json['large'], ''),
        this.slug = Convert.toNotNullableString(json['slug'], ''),
        this.priceBtc = Convert.toDouble(json['price_btc']) ?? 0,
        this.score = Convert.toInt(json['score']) ?? 0 {}

  @override
  String toString() {
    return 'SearchTrendingCoin: id = $id, name = $name';
  }
}

class SearchTrending {
  final List<SearchTrendingCoin> coins;

  static List<SearchTrendingCoin> _parseCoins(Map<String, dynamic> json) {
    final list = Convert.toList(json['coins']);
    final List<SearchTrendingCoin> coins = [];
    if (list != null) {
      list.forEach((element) {
        if (element['item'] != null) {
          coins.add(SearchTrendingCoin.fromJson(element['item']));
        }
      });
    }
    return coins;
  }

  SearchTrending.fromJson(Map<String, dynamic> json) : this.coins = _parseCoins(json) {}

  @override
  String toString() {
    return '${Helpers.getTypeName(SearchTrendingCoin)}';
  }
}
