import 'package:coingecko_api/data/explorer_info.dart';
import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/data/native_currency_usd_data.dart';
import 'package:coingecko_api/data/nft_links_data.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// NFT collection data wrapper
class NftCollectionData {
  /// NFT collection identifier
  final String id;

  /// NFT collection contract address
  final String contractAddress;

  /// NFT collection name
  final String name;

  /// NFT collection asset platform id
  final String assetPlatformId;

  /// NFT collection symbol
  final String symbol;

  /// NFT collection image
  final ImageInfo? image;

  /// NFT collection description
  final String description;

  /// NFT collection native currency
  final String nativeCurrency;

  /// NFT collection native currency symbol
  final String nativeCurrencySymbol;

  /// NFT collection floor price
  final NativeCurrencyUsdData floorPrice;

  /// NFT collection market cap
  final NativeCurrencyUsdData marketCap;

  /// NFT collection volume in 24 hours
  final NativeCurrencyUsdData volume24h;

  /// NFT collection floor price in usd 24 hours percentage change
  final double floorPriceInUsd24hPercentageChange;

  /// NFT collection volume in usd 24 hours percentage change
  final double volumeInUsd24hPercentageChange;

  /// NFT collection floor price in 24 hours percentage change
  final NativeCurrencyUsdData floorPrice24hPercentageChange;

  /// NFT collection market cap 24 hours percentage change
  final NativeCurrencyUsdData marketCap24PercentageChange;

  /// NFT collection volume in 24 hours percentage change
  final NativeCurrencyUsdData volume24hPercentageChange;

  /// Number of unique address owning the NFTs
  final int? numberOfUniqueAddresses;

  /// Number of unique address owning the nfts 24 hours percentage change
  final double? numberOfUniqueAddresses24hPercentageChange;

  /// NFT collection total supply
  final double totalSupply;

  /// NFT collection one day sales
  final double oneDaySales;

  /// NFT collection one day sales 24 hours percentage change
  final double oneSaySales24hPercentageChange;

  /// NFT collection one day average sale price
  final double oneDayAverageSalePrice;

  /// NFT collection one day average sale price 24 hours percentage change
  final double oneDayAverageSalePrice24hPercentageChange;

  /// NFT collection links
  final NftLinksData links;

  /// NFT collection floor price 7 days percentage change
  final NativeCurrencyUsdData floorPrice7dPercentageChange;

  /// NFT collection floor price 14 days percentage change
  final NativeCurrencyUsdData floorPrice14dPercentageChange;

  /// NFT collection floor price 30 days percentage change
  final NativeCurrencyUsdData floorPrice30dPercentageChange;

  /// NFT collection floor price 60 days percentage change
  final NativeCurrencyUsdData floorPrice60dPercentageChange;

  /// NFT collection floor price 1 year percentage change
  final NativeCurrencyUsdData floorPrice1yPercentageChange;

// NFT collection block explorers links
  final List<ExplorerInfo>? explorers;

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
