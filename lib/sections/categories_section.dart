import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/category.dart';
import 'package:coingecko_api/data/category_short.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

class CategoriesSection {
  final Dio _dio;

  const CategoriesSection(this._dio);

  ///
  /// List all categories.
  ///
  /// * Coingecko API ( **GET** /coins/categories/list )
  ///
  Future<CoinGeckoResult<List<CategoryShort>>> listCategoriesShort() async {
    final response = await _dio.get(
      '/coins/categories/list',
    );
    if (response.statusCode == 200) {
      final list = Convert.toList(response.data);
      final List<CategoryShort> categoryList =
          list != null ? list.map((e) => CategoryShort.fromJson(e)).toList() : [];
      return CoinGeckoResult(categoryList);
    } else {
      return CoinGeckoResult(
        [],
        errorMessage: response.data,
        errorCode: response.statusCode ?? null,
        isError: true,
      );
    }
  }

  ///
  /// List all categories with market data.
  ///
  /// * Coingecko API ( **GET** /coins/categories )
  ///
  Future<CoinGeckoResult<List<Category>>> listCategories() async {
    final response = await _dio.get(
      '/coins/categories',
    );
    if (response.statusCode == 200) {
      final list = Convert.toList(response.data);
      final List<Category> categoryList =
          list != null ? list.map((e) => Category.fromJson(e)).toList() : [];
      return CoinGeckoResult(categoryList);
    } else {
      return CoinGeckoResult(
        [],
        errorMessage: response.data,
        errorCode: response.statusCode ?? null,
        isError: true,
      );
    }
  }
}
