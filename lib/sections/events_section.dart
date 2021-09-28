import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/country.dart';
import 'package:coingecko_api/data/event.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class EventsSection {
  final Dio _dio;

  const EventsSection(this._dio);

  ///
  /// Get events, paginated by 100.
  ///
  /// * Coingecko API ( **GET** /events )
  ///
  Future<CoinGeckoResult<List<Event>>> listEvents({
    String? countryCode,
    String? type,
    int? page,
    bool upcomingEventsOnly = true,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'upcoming_events_only': upcomingEventsOnly,
    };
    if (countryCode is String) {
      queryParameters['country_code'] = countryCode;
    }
    if (type is String) {
      queryParameters['type'] = type;
    }
    if (page is int) {
      queryParameters['page'] = page;
    }
    if (fromDate is DateTime) {
      queryParameters['from_date'] = DateFormat('dd-MM-yyyy').format(fromDate);
    }
    if (toDate is DateTime) {
      queryParameters['to_date'] = DateFormat('dd-MM-yyyy').format(toDate);
    }
    final response = await _dio.get(
      '/events',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data['data']) ?? [];
      final list = data.map((e) => Event.fromJson(e)).toList();
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

  ///
  /// Get list of event countries.
  ///
  /// * Coingecko API ( **GET** /events/countries )
  ///
  Future<CoinGeckoResult<List<Country>>> listEventCountries() async {
    final response = await _dio.get(
      '/events/countries',
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data['data']) ?? [];
      final list = data.map((e) => Country.fromJson(e)).toList();
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

  ///
  /// Get list of events types.
  ///
  /// * Coingecko API ( **GET** /events/types )
  ///
  Future<CoinGeckoResult<List<String>>> listEventTypes() async {
    final response = await _dio.get(
      '/events/types',
    );
    if (response.statusCode == 200) {
      final data = Convert.toList(response.data['data']) ?? [];
      final list = data.map((e) => e.toString()).toList();
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
