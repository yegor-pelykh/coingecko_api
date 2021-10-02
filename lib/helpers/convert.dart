import 'package:coingecko_api/helpers/time_unit.dart';

/// A set of methods for converting values
class Convert {
  /// Converts to not-nullable boolean
  static bool toNotNullableBoolean(dynamic d, bool defaultValue) {
    if (d is bool) {
      return d;
    }
    if (d is String) {
      return d.toLowerCase() == 'true';
    }
    return defaultValue;
  }

  /// Converts to nullable boolean
  static bool? toNullableBoolean(dynamic d) {
    if (d is bool) {
      return d;
    }
    if (d is String) {
      return d.toLowerCase() == 'true';
    }
    return null;
  }

  /// Converts to nullable int
  static int? toInt(dynamic d) {
    if (d is int) {
      return d;
    }
    if (d is double) {
      return d.toInt();
    }
    if (d is String) {
      return int.tryParse(d);
    }
    return null;
  }

  /// Converts to nullable double
  static double? toDouble(dynamic d) {
    if (d is double) {
      return d;
    }
    if (d is int) {
      return d.toDouble();
    }
    if (d is String) {
      return double.tryParse(d);
    }
    return null;
  }

  /// Converts to nullable DateTime
  static DateTime? toDateTime(
    dynamic d, {
    TimeUnit unit = TimeUnit.seconds,
  }) {
    if (d is int) {
      return DateTime.fromMillisecondsSinceEpoch(
        unit == TimeUnit.seconds ? d * 1000 : d,
      );
    }
    if (d is double) {
      return DateTime.fromMillisecondsSinceEpoch(
        unit == TimeUnit.seconds ? d.toInt() * 1000 : d.toInt(),
      );
    }
    if (d is String) {
      return DateTime.tryParse(d);
    }
    return null;
  }

  /// Converts to not-nullable String
  static String toNotNullableString(dynamic d, String defaultValue) {
    return d != null ? d.toString() : defaultValue;
  }

  /// Converts to nullable String
  static String? toNullableString(dynamic d) {
    return d != null ? d.toString() : null;
  }

  /// Converts to list
  static List<T>? toList<T>(dynamic d) {
    return d is List<T> ? d : null;
  }

  /// Converts to map
  static Map<T1, T2>? toMap<T1, T2>(dynamic d) {
    if (d is Map<T1, T2>) {
      return d;
    }
    return null;
  }
}
