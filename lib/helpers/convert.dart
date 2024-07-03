import 'package:coingecko_api/helpers/time_unit.dart';

/// A set of methods for converting various types of values.
class Convert {
  /// Converts a dynamic value to a nullable boolean.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a boolean if the conversion is successful, otherwise null.
  static bool? toBooleanN(dynamic d) {
    if (d is bool) {
      return d;
    }
    if (d is String) {
      return d.toLowerCase() == 'true';
    }
    return null;
  }

  /// Converts a dynamic value to a non-nullable boolean.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default boolean value if conversion fails.
  /// Returns a boolean.
  static bool toBoolean(dynamic d, bool def) {
    return toBooleanN(d) ?? def;
  }

  /// Converts a dynamic value to a nullable integer.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns an integer if the conversion is successful, otherwise null.
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

  /// Converts a dynamic value to a non-nullable integer.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default integer value if conversion fails.
  /// Returns an integer.
  static int toInt(dynamic d, int def) {
    return toIntN(d) ?? def;
  }

  /// Converts a dynamic value to a nullable double.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a double if the conversion is successful, otherwise null.
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

  /// Converts a dynamic value to a non-nullable double.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default double value if conversion fails.
  /// Returns a double.
  static double toDouble(dynamic d, double def) {
    return toDoubleN(d) ?? def;
  }

  /// Converts a dynamic value to a nullable DateTime.
  ///
  /// [d] - The dynamic value to be converted.
  /// [unit] - The time unit of the input value (default is seconds).
  /// Returns a DateTime if the conversion is successful, otherwise null.
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

  /// Converts a dynamic value to a non-nullable DateTime.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default DateTime value if conversion fails.
  /// [unit] - The time unit of the input value (default is seconds).
  /// Returns a DateTime.
  static DateTime toDateTime(
    dynamic d,
    DateTime def, {
    TimeUnit unit = TimeUnit.seconds,
  }) {
    return toDateTimeN(d, unit: unit) ?? def;
  }

  /// Converts a dynamic value to a nullable String.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a String if the conversion is successful, otherwise null.
  static String? toStrN(dynamic d) {
    return d != null ? d.toString() : null;
  }

  /// Converts a dynamic value to a non-nullable String.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default String value if conversion fails.
  /// Returns a String.
  static String toStr(dynamic d, String def) {
    return toStrN(d) ?? def;
  }

  /// Converts a dynamic value to a nullable list.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a list if the conversion is successful, otherwise null.
  static List<T>? toListN<T>(dynamic d) {
    return d is List<T> ? d : null;
  }

  /// Converts a dynamic value to a non-nullable list.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default list value if conversion fails.
  /// Returns a list.
  static List<T> toList<T>(dynamic d, List<T> def) {
    return toListN(d) ?? def;
  }

  /// Converts a dynamic value to a nullable map.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a map if the conversion is successful, otherwise null.
  static Map<T1, T2>? toMapN<T1, T2>(dynamic d) {
    return d is Map<T1, T2> ? d : null;
  }

  /// Converts a dynamic value to a non-nullable map.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default map value if conversion fails.
  /// Returns a map.
  static Map<T1, T2> toMap<T1, T2>(dynamic d, Map<T1, T2> def) {
    return toMapN(d) ?? def;
  }

  /// Converts a dynamic value to a non-nullable list of doubles.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a list of doubles.
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

  /// Converts a dynamic value to a non-nullable list of integers.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a list of integers.
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

  /// Converts a dynamic value to a non-nullable list of strings.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a list of strings.
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

  /// Converts a dynamic value to a nullable map of <String, double>.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a map of <String, double> if the conversion is successful, otherwise null.
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

  /// Converts a dynamic value to a non-nullable map of <String, double>.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default map value if conversion fails.
  /// Returns a map of <String, double>.
  static Map<String, double> toMapOfStringDouble(
      dynamic d, Map<String, double> def) {
    return toMapOfStringDoubleN(d) ?? def;
  }

  /// Converts a dynamic value to a nullable map of <String, String>.
  ///
  /// [d] - The dynamic value to be converted.
  /// Returns a map of <String, String> if the conversion is successful, otherwise null.
  static Map<String, String>? toMapOfStringStringN(dynamic d) {
    final jsonMap = Convert.toMapN<String, dynamic>(d);
    return jsonMap != null
        ? jsonMap.map((key, value) => MapEntry(key, value.toString()))
        : null;
  }

  /// Converts a dynamic value to a non-nullable map of <String, String>.
  ///
  /// [d] - The dynamic value to be converted.
  /// [def] - The default map value if conversion fails.
  /// Returns a map of <String, String>.
  static Map<String, String> toMapOfStringString(
      dynamic d, Map<String, String> def) {
    return toMapOfStringStringN(d) ?? def;
  }
}
