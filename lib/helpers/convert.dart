import 'package:coingecko_api/helpers/time_unit.dart';

/// A set of methods for converting values
class Convert {
  /// Converts to nullable boolean
  static bool? toBooleanN(dynamic d) {
    if (d is bool) {
      return d;
    }
    if (d is String) {
      return d.toLowerCase() == 'true';
    }
    return null;
  }

  /// Converts to not-nullable boolean
  static bool toBoolean(dynamic d, bool def) {
    return toBooleanN(d) ?? def;
  }

  /// Converts to nullable int
  static int? toIntN(dynamic d) {
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

  /// Converts to not-nullable int
  static int toInt(dynamic d, int def) {
    return toIntN(d) ?? def;
  }

  /// Converts to nullable double
  static double? toDoubleN(dynamic d) {
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

  /// Converts to not-nullable double
  static double toDouble(dynamic d, double def) {
    return toDoubleN(d) ?? def;
  }

  /// Converts to nullable DateTime
  static DateTime? toDateTimeN(
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

  /// Converts to not-nullable DateTime
  static DateTime toDateTime(
    dynamic d,
    DateTime def, {
    TimeUnit unit = TimeUnit.seconds,
  }) {
    return toDateTimeN(d, unit: unit) ?? def;
  }

  /// Converts to nullable String
  static String? toStrN(dynamic d) {
    return d != null ? d.toString() : null;
  }

  /// Converts to not-nullable String
  static String toStr(dynamic d, String def) {
    return toStrN(d) ?? def;
  }

  /// Converts to nullable list
  static List<T>? toListN<T>(dynamic d) {
    return d is List<T> ? d : null;
  }

  /// Converts to not-nullable list
  static List<T> toList<T>(dynamic d, List<T> def) {
    return toListN(d) ?? def;
  }

  /// Converts to nullable map
  static Map<T1, T2>? toMapN<T1, T2>(dynamic d) {
    return d is Map<T1, T2> ? d : null;
  }

  /// Converts to not-nullable map
  static Map<T1, T2> toMap<T1, T2>(dynamic d, Map<T1, T2> def) {
    return toMapN(d) ?? def;
  }

  /// Converts to not-nullable list of doubles from dynamic
  static List<double> toListOfDouble(dynamic d) {
    final jsonList = Convert.toListN(d);
    final List<double> result = [];
    if (jsonList != null) {
      jsonList.forEach((e) {
        final d = Convert.toDoubleN(e);
        if (d != null) {
          result.add(d);
        }
      });
    }
    return result;
  }

  /// Converts to not-nullable list of integers from dynamic
  static List<int> toListOfInt(dynamic d) {
    final jsonList = Convert.toListN(d);
    final List<int> result = [];
    if (jsonList != null) {
      jsonList.forEach((e) {
        final i = Convert.toIntN(e);
        if (i != null) {
          result.add(i);
        }
      });
    }
    return result;
  }

  /// Converts to not-nullable list of strings from dynamic
  static List<String> toListOfString(dynamic d) {
    final jsonList = Convert.toListN(d);
    final List<String> result = [];
    if (jsonList != null) {
      jsonList.forEach((e) {
        final s = Convert.toStrN(e);
        if (s != null) {
          result.add(s);
        }
      });
    }
    return result;
  }

  /// Converts to nullable map of <String, double> from dynamic
  static Map<String, double>? toMapOfStringDoubleN(dynamic d) {
    final jsonMap = Convert.toMapN<String, dynamic>(d);
    final Map<String, double> result = {};
    if (jsonMap != null) {
      jsonMap.forEach((key, value) {
        final d = Convert.toDoubleN(value);
        if (d != null) {
          result[key] = d;
        }
      });
    }
    return result;
  }

  /// Converts to not-nullable map of <String, double> from dynamic
  static Map<String, double> toMapOfStringDouble(
      dynamic d, Map<String, double> def) {
    return toMapOfStringDoubleN(d) ?? def;
  }

  /// Converts to nullable map of <String, String> from dynamic
  static Map<String, String>? toMapOfStringStringN(dynamic d) {
    final jsonMap = Convert.toMapN<String, dynamic>(d);
    return jsonMap != null
        ? jsonMap.map((key, value) => MapEntry(key, value.toString()))
        : null;
  }

  /// Converts to not-nullable map of <String, String> from dynamic
  static Map<String, String> toMapOfStringString(
      dynamic d, Map<String, String> def) {
    return toMapOfStringStringN(d) ?? def;
  }
}
