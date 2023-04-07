import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
];

const String apikey = '1249A678-3198-4433-8966-C48C8BF26A1D';
const String baseUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getRate(String cur) async {
    var data = {};
    for (var coin in cryptoList) {
      var url = '$baseUrl/$coin/$cur';
      var uri = Uri.parse(url);

      Response res = await get(uri, headers: {'X-CoinAPI-Key': apikey});
      if (res.statusCode == 200) {
        dynamic temp = jsonDecode(res.body);

        data[coin] = {
          "rate": temp["rate"].toStringAsFixed(2),
        };
      }
    }
    data["time"] = {
      "time": DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now()),
    };

    return data;
  }
}
