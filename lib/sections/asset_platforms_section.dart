import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/asset_platform.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';

/// The section that brings together the requests that are related
/// to asset platforms
class AssetPlatformsSection {
  final Client _client;

  const AssetPlatformsSection(this._client);

  ///
  /// List all asset platforms (Blockchain networks).
  ///
  /// Query: **/asset\_platforms**
  ///
  Future<CoinGeckoResult<List<AssetPlatform>>> listAssetPlatforms() async {
    final response = await _client.dio.get(
      '/asset_platforms',
    );
    if (response.statusCode == 200) {
      final list = Convert.toListN(response.data);
      final List<AssetPlatform> categoryList = list != null
          ? list.map((e) => AssetPlatform.fromJson(e)).toList()
          : [];
      return CoinGeckoResult(categoryList);
    } else {
      return CoinGeckoResult(
        [],
        errorMessage: response.data.toString(),
        errorCode: response.statusCode ?? null,
        isError: true,
      );
    }
  }
}
