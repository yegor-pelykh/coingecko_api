import 'package:coingecko_api/helpers/convert.dart';

/// Coin search results data wrapper
class CoinSearchResults {
  /// Identifier
  final String id;

  /// Coin name
  final String name;

  /// Coin API symbol
  final String apiSymbol;

  /// Coin symbol
  final String symbol;

  /// Market capitalization rank
  final int marketCapRank;

  /// Thumbnail image url
  final String thumb;

  /// Large image url
  final String large;

  CoinSearchResults.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.apiSymbol = Convert.toStr(json['api_symbol'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.marketCapRank = Convert.toInt(json['market_cap_rank'], 0),
        this.thumb = Convert.toStr(json['thumb'], ''),
        this.large = Convert.toStr(json['large'], '');

  @override
  String toString() {
    return 'CoinSearchResults: id = $id, name = $name';
  }
}

/// Exchange search results data wrapper
class ExchangeSearchResults {
  /// Identifier
  final String id;

  /// Exchange name
  final String name;

  /// Exchange market type
  final String marketType;

  /// Thumbnail image url
  final String thumb;

  /// Large image url
  final String large;

  ExchangeSearchResults.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.marketType = Convert.toStr(json['market_type'], ''),
        this.thumb = Convert.toStr(json['thumb'], ''),
        this.large = Convert.toStr(json['large'], '');

  @override
  String toString() {
    return 'ExchangeSearchResults: id = $id, name = $name';
  }
}

/// Category search results data wrapper
class CategorySearchResults {
  /// Identifier
  final int id;

  /// Category name
  final String name;

  CategorySearchResults.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toInt(json['id'], 0),
        this.name = Convert.toStr(json['name'], '');

  @override
  String toString() {
    return 'CategorySearchResults: id = $id, name = $name';
  }
}

/// NFT search results data wrapper
class NftSearchResults {
  /// Identifier
  final String id;

  /// NFT name
  final String name;

  /// NFT symbol
  final String symbol;

  /// Thumbnail image url
  final String thumb;

  NftSearchResults.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.thumb = Convert.toStr(json['thumb'], '');

  @override
  String toString() {
    return 'NftSearchResults: id = $id, name = $name';
  }
}

/// Search results data wrapper
class SearchResults {
  /// Coins
  final List<CoinSearchResults>? coins;

  /// Exchanges
  final List<ExchangeSearchResults>? exchanges;

  /// Categories
  final List<CategorySearchResults>? categories;

  /// NFTs
  final List<NftSearchResults>? nfts;

  static List<CoinSearchResults>? _parseCoins(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => CoinSearchResults.fromJson(e)).toList()
        : null;
  }

  static List<ExchangeSearchResults>? _parseExchanges(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => ExchangeSearchResults.fromJson(e)).toList()
        : null;
  }

  static List<CategorySearchResults>? _parseCategories(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => CategorySearchResults.fromJson(e)).toList()
        : null;
  }

  static List<NftSearchResults>? _parseNFTs(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => NftSearchResults.fromJson(e)).toList()
        : null;
  }

  SearchResults.fromJson(Map<String, dynamic> json)
      : this.coins = _parseCoins(json['coins']),
        this.exchanges = _parseExchanges(json['exchanges']),
        this.categories = _parseCategories(json['categories']),
        this.nfts = _parseNFTs(json['nfts']);

  @override
  String toString() {
    return 'SearchResults';
  }
}
