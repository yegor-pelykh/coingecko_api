import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/category.dart';
import 'package:coingecko_api/data/category_short.dart';
import 'package:coingecko_api/helpers/client.dart';
import 'package:coingecko_api/helpers/convert.dart';

/// The section that brings together the requests that are
/// related to categories
class CategoriesSection {
  final Client _client;

  const CategoriesSection(this._client);

  ///
  /// List all categories.
  ///
  /// Query: **/coins/categories/list**
  ///
  Future<CoinGeckoResult<List<CategoryShort>>> listCategoriesShort() async {
    final response = await _client.dio.get(
      '/coins/categories/list',
    );
    if (response.statusCode == 200) {
      final list = Convert.toListN(response.data);
      final List<CategoryShort> categoryList = list != null
          ? list.map((e) => CategoryShort.fromJson(e)).toList()
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

  ///
  /// List all categories with market data.
  ///
  /// Query: **/coins/categories**
  ///
  Future<CoinGeckoResult<List<Category>>> listCategories() async {
    final response = await _client.dio.get(
      '/coins/categories',
    );
    if (response.statusCode == 200) {
      final list = Convert.toListN(response.data);
      final List<Category> categoryList =
          list != null ? list.map((e) => Category.fromJson(e)).toList() : [];
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
