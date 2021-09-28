enum TimeUnit {
  seconds,
  milliseconds,
}

class Convert {
  static bool toNotNullableBoolean(dynamic d, bool defaultValue) {
    if (d is bool) {
      return d;
    }
    if (d is String) {
      return d.toLowerCase() == 'true';
    }
    return defaultValue;
  }

  static bool? toNullableBoolean(dynamic d) {
    if (d is bool) {
      return d;
    }
    if (d is String) {
      return d.toLowerCase() == 'true';
    }
    return null;
  }

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

  static String toNotNullableString(dynamic d, String defaultValue) {
    return d != null ? d.toString() : defaultValue;
  }

  static String? toNullableString(dynamic d) {
    return d != null ? d.toString() : null;
  }

  static List<T>? toList<T>(dynamic d) {
    return d is List<T> ? d : null;
  }

  static Map<T1, T2>? toMap<T1, T2>(dynamic d) {
    if (d is Map<T1, T2>) {
      return d;
    }
    return null;
  }
}
