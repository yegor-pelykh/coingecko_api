import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/enumerations.dart';
import 'package:coingecko_api/data/nft_collection_data.dart';
import 'package:coingecko_api/data/nft_info.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';

/// The section that brings together the requests
/// that are related to NFTs
class NftsSection {
  final Client _client;

  const NftsSection(this._client);

  ///
  /// Get all supported NFTs with id, contract address, name, asset platform id
  /// and symbol on CoinGecko
  ///
  /// **[order]** sets the sort order of responses
  ///
  /// **[itemsPerPage]** sets total results per page. Valid values: 1...250.
  /// Default is 100.
  ///
  /// **[page]** sets page through results.
  /// Default is 1.
  ///
  /// Query: **/nfts/list**
  ///
  Future<CoinGeckoResult<List<NftInfo>>> listNfts({
    String order = NftsListOrder.marketCapUsdDescending,
    int itemsPerPage = 100,
    int page = 1,
  }) async {
    final response = await _client.dio.get(
      '/nfts/list',
      queryParameters: {
        'order': order,
        'per_page': itemsPerPage,
        'page': page,
      },
    );
    if (response.statusCode == 200) {
      List<NftInfo> nftInfo = [];
      final list = Convert.toListN<dynamic>(response.data);
      if (list != null) {
        list.forEach((value) {
          nftInfo.add(NftInfo.fromJson(value));
        });
      }
      return CoinGeckoResult(nftInfo);
    } else {
      return CoinGeckoResult(
        [],
        errorMessage: response.data.toString(),
        errorCode: response.statusCode ?? null,
        isError: true,
      );
    }
  }

  ///
  /// Get all the NFT data (name, floor price, 24 hr volume....) based on the
  /// nft collection id
  ///
  /// **[id]** sets NFT collection id
  ///
  /// Query: **/nfts/{id}**
  ///
  Future<CoinGeckoResult<NftCollectionData?>> getDataById({
    required String id,
  }) async {
    final response = await _client.dio.get(
      '/nfts/$id',
    );
    if (response.statusCode == 200) {
      final map = Convert.toMapN<String, dynamic>(response.data);
      final data = map != null ? NftCollectionData.fromJson(map) : null;
      return CoinGeckoResult(data);
    } else {
      return CoinGeckoResult(
        null,
        errorMessage: response.data.toString(),
        errorCode: response.statusCode ?? null,
        isError: true,
      );
    }
  }

  ///
  /// Get all the NFT data (name, floor price, 24 hr volume....) based on the
  /// nft collection contract address and respective asset platform
  ///
  /// **[assetPlatformId]** sets the asset platform id.
  /// Refers to /asset_platforms
  ///
  /// **[contractAddress]** sets the contract address of token.
  ///
  /// Query: **/nfts/{asset_platform_id}/contract/{contract_address}**
  ///
  Future<CoinGeckoResult<NftCollectionData?>> getDataByContractAddress({
    required String assetPlatformId,
    required String contractAddress,
  }) async {
    final response = await _client.dio.get(
      '/nfts/$assetPlatformId/contract/$contractAddress',
    );
    if (response.statusCode == 200) {
      final map = Convert.toMapN<String, dynamic>(response.data);
      final data = map != null ? NftCollectionData.fromJson(map) : null;
      return CoinGeckoResult(data);
    } else {
      return CoinGeckoResult(
        null,
        errorMessage: response.data.toString(),
        errorCode: response.statusCode ?? null,
        isError: true,
      );
    }
  }
}
