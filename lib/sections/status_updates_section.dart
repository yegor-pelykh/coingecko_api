import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/status_update.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';

class StatusUpdatesSection {
  final Dio _dio;

  const StatusUpdatesSection(this._dio);

  ///
  /// List all status_updates with data.
  ///
  /// * Coingecko API ( **GET** /status_updates )
  ///
  Future<CoinGeckoResult<List<StatusUpdate>>> listStatusUpdates({
    String? category,
    String? projectType,
    int? perPage,
    int? page,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (category is String) {
      queryParameters['category'] = category;
    }
    if (projectType is String) {
      queryParameters['project_type'] = projectType;
    }
    if (perPage is int) {
      queryParameters['per_page'] = perPage;
    }
    if (page is int) {
      queryParameters['page'] = page;
    }
    final response = await _dio.get(
      '/status_updates',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data['status_updates']) ?? [];
      final list = data.map((e) => StatusUpdate.fromJson(e)).toList();
      return CoinGeckoResult(list);
    } else {
      return CoinGeckoResult(
        [],
        errorCode: response.statusCode ?? null,
        errorMessage: '${response.statusMessage} - ${response.data.toString()}',
        isError: true,
      );
    }
  }
}
