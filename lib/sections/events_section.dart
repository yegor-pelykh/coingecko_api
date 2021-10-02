import 'package:coingecko_api/coingecko_result.dart';
import 'package:coingecko_api/data/country.dart';
import 'package:coingecko_api/data/event.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

/// The section that brings together the requests that are related to events
class EventsSection {
  final Dio _dio;

  const EventsSection(this._dio);

  ///
  /// Get events, paginated by 100.
  ///
  /// **[countryCode]** is the country code.
  ///
  /// **[type]** is the type of event.
  ///
  /// **[page]** sets the page of results (paginated by 100).
  ///
  /// **[upcomingEventsOnly]** filters whether to display only
  /// upcoming events or all events. Default is true.
  ///
  /// **[from]** is FROM date.
  ///
  /// **[to]** is TO date.
  ///
  /// Query: **/events**
  ///
  Future<CoinGeckoResult<List<Event>>> listEvents({
    String? countryCode,
    String? type,
    int? page,
    bool upcomingEventsOnly = true,
    DateTime? from,
    DateTime? to,
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
    if (from is DateTime) {
      queryParameters['from_date'] = DateFormat('dd-MM-yyyy').format(from);
    }
    if (to is DateTime) {
      queryParameters['to_date'] = DateFormat('dd-MM-yyyy').format(to);
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
  /// Query: **/events/countries**
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
  /// Query: **/events/types**
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
