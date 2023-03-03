import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/asset_platform.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

/// The section that brings together the requests that are related
/// to asset platforms
class AssetPlatformsSection {
  final Dio _dio;

  const AssetPlatformsSection(this._dio);

  ///
  /// List all asset platforms (Blockchain networks).
  ///
  /// Query: **/asset\_platforms**
  ///
  Future<CoinGeckoResult<List<AssetPlatform>>> listAssetPlatforms() async {
    final response = await _dio.get(
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
