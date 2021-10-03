import 'dart:collection';

import 'package:coingecko_api/data/market_chart_data.dart';
import 'package:coingecko_api/data/market_data.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/time_unit.dart';

/// A set of methods for common tasks
class Helpers {
  /// Gets the type name of [d]
  static String getTypeName(dynamic d) {
    final Type t = d;
    return t.toString();
  }

  /// Gets the default DateTime instance
  static DateTime defaultDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(0);
  }

  /// Checks if [d] is default DateTime instance
  static bool isDefaultDateTime(DateTime d) {
    return d.millisecondsSinceEpoch == 0;
  }

  /// Parses list of doubles from dynamic
  static List<double> parseListDouble(dynamic d) {
    final jsonList = Convert.toList(d);
    final List<double> result = [];
    if (jsonList != null) {
      jsonList.forEach((e) {
        final d = Convert.toDouble(e);
        if (d != null) {
          result.add(d);
        }
      });
    }
    return result;
  }

  /// Parses list of integers from dynamic
  static List<int> parseListInt(dynamic d) {
    final jsonList = Convert.toList(d);
    final List<int> result = [];
    if (jsonList != null) {
      jsonList.forEach((e) {
        final i = Convert.toInt(e);
        if (i != null) {
          result.add(i);
        }
      });
    }
    return result;
  }

  /// Parses list of strings from dynamic
  static List<String> parseListString(dynamic d) {
    final jsonList = Convert.toList(d);
    final List<String> result = [];
    if (jsonList != null) {
      jsonList.forEach((e) {
        final s = Convert.toNullableString(e);
        if (s != null) {
          result.add(s);
        }
      });
    }
    return result;
  }

  /// Parses map of <String, double> from dynamic
  static Map<String, double>? parseMapStringDouble(dynamic d) {
    final jsonMap = Convert.toMap<String, dynamic>(d);
    final Map<String, double> result = {};
    if (jsonMap != null) {
      jsonMap.forEach((key, value) {
        final d = Convert.toDouble(value);
        if (d != null) {
          result[key] = d;
        }
      });
    }
    return result;
  }

  /// Parses map of <String, String> from dynamic
  static Map<String, String>? parseMapStringString(dynamic d) {
    final jsonMap = Convert.toMap<String, dynamic>(d);
    return jsonMap != null
        ? jsonMap.map((key, value) => MapEntry(key, value.toString()))
        : null;
  }

  /// Parses list of [MarketChartData] from dynamic
  static List<MarketChartData> parseMarketChartData(dynamic d) {
    final map = Convert.toMap<String, dynamic>(d);
    if (map == null) {
      return [];
    }
    // prices
    final coinData = SplayTreeMap<DateTime, MarketChartData>();
    var workingList = Convert.toList(map['prices']);
    workingList?.forEach((e) {
      final item = Convert.toList(e);
      if (item != null) {
        final date = Convert.toDateTime(item[0], unit: TimeUnit.milliseconds);
        if (date != null) {
          final price = Convert.toDouble(item[1]);
          var data = coinData[date];
          if (data != null) {
            data.price = price;
          } else {
            coinData[date] = MarketChartData(date, price: price);
          }
        }
      }
    });
    // market_caps
    workingList = Convert.toList(map['market_caps']);
    workingList?.forEach((e) {
      final item = Convert.toList(e);
      if (item != null) {
        final date = Convert.toDateTime(item[0], unit: TimeUnit.milliseconds);
        if (date != null) {
          final marketCap = Convert.toDouble(item[1]);
          var data = coinData[date];
          if (data != null) {
            data.marketCap = marketCap;
          } else {
            coinData[date] = MarketChartData(date, marketCap: marketCap);
          }
        }
      }
    });
    // total_volumes
    workingList = Convert.toList(map['total_volumes']);
    workingList?.forEach((e) {
      final item = Convert.toList(e);
      if (item != null) {
        final date = Convert.toDateTime(item[0], unit: TimeUnit.milliseconds);
        if (date != null) {
          final totalVolume = Convert.toDouble(item[1]);
          var data = coinData[date];
          if (data != null) {
            data.totalVolume = totalVolume;
          } else {
            coinData[date] = MarketChartData(date, totalVolume: totalVolume);
          }
        }
      }
    });
    return coinData.values.toList(
      growable: false,
    );
  }

  /// Parses list of [MarketData] from dynamic
  static List<MarketData> parseMarketData(dynamic d) {
    final map = Convert.toMap<String, dynamic>(d);
    if (map == null) {
      return [];
    }
    // current_price
    final marketData = SplayTreeMap<String, MarketData>();
    var workingMap = Convert.toMap(map['current_price']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.currentPrice = v;
        } else {
          marketData[id] = MarketData(id, currentPrice: v);
        }
      }
    });
    // market_cap
    workingMap = Convert.toMap(map['market_cap']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.marketCap = v;
        } else {
          marketData[id] = MarketData(id, marketCap: v);
        }
      }
    });
    // total_volume
    workingMap = Convert.toMap(map['total_volume']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.totalVolume = v;
        } else {
          marketData[id] = MarketData(id, totalVolume: v);
        }
      }
    });
    // ath
    workingMap = Convert.toMap(map['ath']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.ath = v;
        } else {
          marketData[id] = MarketData(id, ath: v);
        }
      }
    });
    // ath_change_percentage
    workingMap = Convert.toMap(map['ath_change_percentage']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.athChangePercentage = v;
        } else {
          marketData[id] = MarketData(id, athChangePercentage: v);
        }
      }
    });
    // ath_date
    workingMap = Convert.toMap(map['ath_date']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDateTime(value);
        final data = marketData[id];
        if (data != null) {
          data.athDate = v;
        } else {
          marketData[id] = MarketData(id, athDate: v);
        }
      }
    });
    // atl
    workingMap = Convert.toMap(map['atl']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.atl = v;
        } else {
          marketData[id] = MarketData(id, atl: v);
        }
      }
    });
    // atl_change_percentage
    workingMap = Convert.toMap(map['atl_change_percentage']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.atlChangePercentage = v;
        } else {
          marketData[id] = MarketData(id, atlChangePercentage: v);
        }
      }
    });
    // atl_date
    workingMap = Convert.toMap(map['atl_date']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDateTime(value);
        final data = marketData[id];
        if (data != null) {
          data.atlDate = v;
        } else {
          marketData[id] = MarketData(id, atlDate: v);
        }
      }
    });
    // fully_diluted_valuation
    workingMap = Convert.toMap(map['fully_diluted_valuation']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.fullyDilutedValuation = v;
        } else {
          marketData[id] = MarketData(id, fullyDilutedValuation: v);
        }
      }
    });
    // high_24h
    workingMap = Convert.toMap(map['high_24h']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.high24h = v;
        } else {
          marketData[id] = MarketData(id, high24h: v);
        }
      }
    });
    // low_24h
    workingMap = Convert.toMap(map['low_24h']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.low24h = v;
        } else {
          marketData[id] = MarketData(id, low24h: v);
        }
      }
    });
    // price_change_24h_in_currency
    workingMap = Convert.toMap(map['price_change_24h_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChange24hInCurrency = v;
        } else {
          marketData[id] = MarketData(id, priceChange24hInCurrency: v);
        }
      }
    });
    // price_change_percentage_1h_in_currency
    workingMap = Convert.toMap(map['price_change_percentage_1h_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChangePercentage1hInCurrency = v;
        } else {
          marketData[id] = MarketData(id, priceChangePercentage1hInCurrency: v);
        }
      }
    });
    // price_change_percentage_24h_in_currency
    workingMap = Convert.toMap(map['price_change_percentage_24h_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChangePercentage24hInCurrency = v;
        } else {
          marketData[id] =
              MarketData(id, priceChangePercentage24hInCurrency: v);
        }
      }
    });
    // price_change_percentage_7d_in_currency
    workingMap = Convert.toMap(map['price_change_percentage_7d_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChangePercentage7dInCurrency = v;
        } else {
          marketData[id] = MarketData(id, priceChangePercentage7dInCurrency: v);
        }
      }
    });
    // price_change_percentage_14d_in_currency
    workingMap = Convert.toMap(map['price_change_percentage_14d_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChangePercentage14dInCurrency = v;
        } else {
          marketData[id] =
              MarketData(id, priceChangePercentage14dInCurrency: v);
        }
      }
    });
    // price_change_percentage_30d_in_currency
    workingMap = Convert.toMap(map['price_change_percentage_30d_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChangePercentage30dInCurrency = v;
        } else {
          marketData[id] =
              MarketData(id, priceChangePercentage30dInCurrency: v);
        }
      }
    });
    // price_change_percentage_60d_in_currency
    workingMap = Convert.toMap(map['price_change_percentage_60d_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChangePercentage60dInCurrency = v;
        } else {
          marketData[id] =
              MarketData(id, priceChangePercentage60dInCurrency: v);
        }
      }
    });
    // price_change_percentage_200d_in_currency
    workingMap = Convert.toMap(map['price_change_percentage_200d_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChangePercentage200dInCurrency = v;
        } else {
          marketData[id] =
              MarketData(id, priceChangePercentage200dInCurrency: v);
        }
      }
    });
    // price_change_percentage_1y_in_currency
    workingMap = Convert.toMap(map['price_change_percentage_1y_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.priceChangePercentage1yInCurrency = v;
        } else {
          marketData[id] = MarketData(id, priceChangePercentage1yInCurrency: v);
        }
      }
    });
    // market_cap_change_24h_in_currency
    workingMap = Convert.toMap(map['market_cap_change_24h_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.marketCapChange24hInCurrency = v;
        } else {
          marketData[id] = MarketData(id, marketCapChange24hInCurrency: v);
        }
      }
    });
    // market_cap_change_percentage_24h_in_currency
    workingMap =
        Convert.toMap(map['market_cap_change_percentage_24h_in_currency']);
    workingMap?.forEach((key, value) {
      final id = Convert.toNullableString(key);
      if (id != null) {
        final v = Convert.toDouble(value);
        final data = marketData[id];
        if (data != null) {
          data.marketCapChangePercentage24hInCurrency = v;
        } else {
          marketData[id] =
              MarketData(id, marketCapChangePercentage24hInCurrency: v);
        }
      }
    });
    return marketData.values.toList(
      growable: false,
    );
  }
}
