import 'package:coingecko_api/data/explorer_info.dart';
import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/data/native_currency_usd_data.dart';
import 'package:coingecko_api/data/nft_links_data.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// A class representing data for an NFT collection.
class NftCollectionData {
  /// The unique identifier for the NFT collection.
  final String id;

  /// The contract address of the NFT collection.
  final String contractAddress;

  /// The name of the NFT collection.
  final String name;

  /// The asset platform ID of the NFT collection.
  final String assetPlatformId;

  /// The symbol of the NFT collection.
  final String symbol;

  /// The image associated with the NFT collection.
  final ImageInfo? image;

  /// The description of the NFT collection.
  final String description;

  /// The native currency of the NFT collection.
  final String nativeCurrency;

  /// The symbol of the native currency of the NFT collection.
  final String nativeCurrencySymbol;

  /// The floor price of the NFT collection.
  final NativeCurrencyUsdData floorPrice;

  /// The market cap of the NFT collection.
  final NativeCurrencyUsdData marketCap;

  /// The 24-hour volume of the NFT collection.
  final NativeCurrencyUsdData volume24h;

  /// The 24-hour percentage change in floor price in USD.
  final double floorPriceInUsd24hPercentageChange;

  /// The 24-hour percentage change in volume in USD.
  final double volumeInUsd24hPercentageChange;

  /// The 24-hour percentage change in floor price.
  final NativeCurrencyUsdData floorPrice24hPercentageChange;

  /// The 24-hour percentage change in market cap.
  final NativeCurrencyUsdData marketCap24PercentageChange;

  /// The 24-hour percentage change in volume.
  final NativeCurrencyUsdData volume24hPercentageChange;

  /// The number of unique addresses owning the NFTs.
  final int? numberOfUniqueAddresses;

  /// The 24-hour percentage change in the number of unique addresses owning the NFTs.
  final double? numberOfUniqueAddresses24hPercentageChange;

  /// The total supply of the NFT collection.
  final double totalSupply;

  /// The one-day sales of the NFT collection.
  final double oneDaySales;

  /// The 24-hour percentage change in one-day sales.
  final double oneSaySales24hPercentageChange;

  /// The one-day average sale price of the NFT collection.
  final double oneDayAverageSalePrice;

  /// The 24-hour percentage change in one-day average sale price.
  final double oneDayAverageSalePrice24hPercentageChange;

  /// The links associated with the NFT collection.
  final NftLinksData links;

  /// The 7-day percentage change in floor price.
  final NativeCurrencyUsdData floorPrice7dPercentageChange;

  /// The 14-day percentage change in floor price.
  final NativeCurrencyUsdData floorPrice14dPercentageChange;

  /// The 30-day percentage change in floor price.
  final NativeCurrencyUsdData floorPrice30dPercentageChange;

  /// The 60-day percentage change in floor price.
  final NativeCurrencyUsdData floorPrice60dPercentageChange;

  /// The 1-year percentage change in floor price.
  final NativeCurrencyUsdData floorPrice1yPercentageChange;

  /// The list of block explorer links for the NFT collection.
  final List<ExplorerInfo>? explorers;

  /// Constructs an instance of [NftCollectionData] from a JSON object.
  ///
  /// [json] is a map containing the JSON data.
  NftCollectionData.fromJson(Map<String, dynamic> json)
      : this.id = Convert.toStr(json['id'], ''),
        this.contractAddress = Convert.toStr(json['contract_address'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.assetPlatformId = Convert.toStr(json['asset_platform_id'], ''),
        this.symbol = Convert.toStr(json['symbol'], ''),
        this.image = json.containsKey('image')
            ? ImageInfo.fromJson(json['image'])
            : null,
        this.description = Convert.toStr(json['description'], ''),
        this.nativeCurrency = Convert.toStr(json['native_currency'], ''),
        this.nativeCurrencySymbol =
            Convert.toStr(json['native_currency_symbol'], ''),
        this.floorPrice = NativeCurrencyUsdData.fromJson(json['floor_price']),
        this.marketCap = NativeCurrencyUsdData.fromJson(json['market_cap']),
        this.volume24h = NativeCurrencyUsdData.fromJson(json['volume_24h']),
        this.floorPriceInUsd24hPercentageChange = Convert.toDouble(
            json['floor_price_in_usd_24h_percentage_change'], 0),
        this.volumeInUsd24hPercentageChange =
            Convert.toDouble(json['volume_in_usd_24h_percentage_change'], 0),
        this.floorPrice24hPercentageChange = NativeCurrencyUsdData.fromJson(
            json['floor_price_24h_percentage_change']),
        this.marketCap24PercentageChange = NativeCurrencyUsdData.fromJson(
            json['market_cap_24h_percentage_change']),
        this.volume24hPercentageChange = NativeCurrencyUsdData.fromJson(
            json['volume_24h_percentage_change']),
        this.numberOfUniqueAddresses =
            Convert.toIntN(json['number_of_unique_addresses']),
        this.numberOfUniqueAddresses24hPercentageChange = Convert.toDoubleN(
            json['number_of_unique_addresses_24h_percentage_change']),
        this.totalSupply = Convert.toDouble(json['total_supply'], 0),
        this.oneDaySales = Convert.toDouble(json['one_day_sales'], 0),
        this.oneSaySales24hPercentageChange =
            Convert.toDouble(json['one_day_sales_24h_percentage_change'], 0),
        this.oneDayAverageSalePrice =
            Convert.toDouble(json['one_day_average_sale_price'], 0),
        this.oneDayAverageSalePrice24hPercentageChange = Convert.toDouble(
            json['one_day_average_sale_price_24h_percentage_change'], 0),
        this.links = NftLinksData.fromJson(json['links']),
        this.floorPrice7dPercentageChange = NativeCurrencyUsdData.fromJson(
            json['floor_price_7d_percentage_change']),
        this.floorPrice14dPercentageChange = NativeCurrencyUsdData.fromJson(
            json['floor_price_14d_percentage_change']),
        this.floorPrice30dPercentageChange = NativeCurrencyUsdData.fromJson(
            json['floor_price_30d_percentage_change']),
        this.floorPrice60dPercentageChange = NativeCurrencyUsdData.fromJson(
            json['floor_price_60d_percentage_change']),
        this.floorPrice1yPercentageChange = NativeCurrencyUsdData.fromJson(
            json['floor_price_1y_percentage_change']),
        this.explorers = _parseExplorers(json['explorers']) {}

  /// Parses a list of [ExplorerInfo] from a JSON object.
  ///
  /// [json] is the JSON data to parse.
  static List<ExplorerInfo>? _parseExplorers(dynamic json) {
    final jsonList = Convert.toListN(json);
    return jsonList != null
        ? jsonList.map((e) => ExplorerInfo.fromJson(e)).toList()
        : null;
  }

  @override
  String toString() {
    return '${Helpers.getTypeName(NftCollectionData)}: id = $id, name = $name';
  }
}
