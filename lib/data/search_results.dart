import 'package:coingecko_api/helpers/convert.dart';

/// Coin search results data wrapper
class CoinSearchResults {
  /// Identifier of the coin
  final String id;

  /// Name of the coin
  final String name;

  /// API symbol of the coin
  final String apiSymbol;

  /// Symbol of the coin
  final String symbol;

  /// Market capitalization rank of the coin
  final int marketCapRank;

  /// Thumbnail image URL of the coin
  final String thumb;

  /// Large image URL of the coin
  final String large;

  /// Constructs a [CoinSearchResults] instance from a JSON map.
  ///
  /// [json] is the JSON map containing the coin data.
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
  /// Identifier of the exchange
  final String id;

  /// Name of the exchange
  final String name;

  /// Market type of the exchange
  final String marketType;

  /// Thumbnail image URL of the exchange
  final String thumb;

  /// Large image URL of the exchange
  final String large;

  /// Constructs an [ExchangeSearchResults] instance from a JSON map.
  ///
  /// [json] is the JSON map containing the exchange data.
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
  /// Identifier of the category
  final int id;

  /// Name of the category
  final String name;

  /// Constructs a [CategorySearchResults] instance from a JSON map.
  ///
  /// [json] is the JSON map containing the category data.
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
  /// Identifier of the NFT
  final String id;

  /// Name of the NFT
  final String name;

  /// Symbol of the NFT
  final String symbol;

  /// Thumbnail image URL of the NFT
  final String thumb;

  /// Constructs an [NftSearchResults] instance from a JSON map.
  ///
  /// [json] is the JSON map containing the NFT data.
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
  /// List of coin search results
  final List<CoinSearchResults>? coins;

  /// List of exchange search results
  final List<ExchangeSearchResults>? exchanges;

  /// List of category search results
  final List<CategorySearchResults>? categories;

  /// List of NFT search results
  final List<NftSearchResults>? nfts;

  /// Parses a list of coin search results from JSON.
  ///
  /// [json] is the JSON data to parse.
  static List<CoinSearchResults>? _parseCoins(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => CoinSearchResults.fromJson(e)).toList()
        : null;
  }

  /// Parses a list of exchange search results from JSON.
  ///
  /// [json] is the JSON data to parse.
  static List<ExchangeSearchResults>? _parseExchanges(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => ExchangeSearchResults.fromJson(e)).toList()
        : null;
  }

  /// Parses a list of category search results from JSON.
  ///
  /// [json] is the JSON data to parse.
  static List<CategorySearchResults>? _parseCategories(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => CategorySearchResults.fromJson(e)).toList()
        : null;
  }

  /// Parses a list of NFT search results from JSON.
  ///
  /// [json] is the JSON data to parse.
  static List<NftSearchResults>? _parseNFTs(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => NftSearchResults.fromJson(e)).toList()
        : null;
  }

  /// Constructs a [SearchResults] instance from a JSON map.
  ///
  /// [json] is the JSON map containing the search results data.
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
