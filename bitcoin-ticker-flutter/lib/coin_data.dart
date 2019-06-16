import 'dart:convert';

import 'package:http/http.dart' as http;

const URL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

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
  'LTC',
];

class CoinData {
  Future<double> getLastPrice({String crypto, String currency}) async {
    final url = '$URL$crypto$currency';
    print('$currency $url');
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final double price = data['last'];
      return price;
    } else {
      print('failed to retrieve price with statue = $response.statusCode');
      return -1.0;
    }
  }
}
