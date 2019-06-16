import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  Map<String, double> price = Map<String, double>();
  final coinData = CoinData();

  @override
  void initState() {
    super.initState();
    getCoinPrices();
  }

  void getCoinPrices({String currency}) {
    cryptoList.forEach((crypto) {
      price.putIfAbsent(crypto, () => -1.0);
      getCoinPrice(crypto: crypto).then((p) {
        setState(() {
          this.price[crypto] = p;
        });
      });
    });
  }

  Future<double> getCoinPrice({@required String crypto, String currency}) async {
    return await coinData.getLastPrice(crypto: crypto, currency: currency != null ? currency : selectedCurrency);
  }

  Widget createPickerWidget() {
    if (Platform.isIOS) {
      return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) async {
          setState(() {
            selectedCurrency = currenciesList[selectedIndex];
          });
          getCoinPrices(currency: selectedCurrency);
        },
        children: currenciesList.map((c) => Text(c)).toList(),
      );
    } else {
      return DropdownButton<String>(
        value: selectedCurrency,
        items: currenciesList.map((c) => DropdownMenuItem(child: Text(c), value: c)).toList(),
        onChanged: (value) async {
          setState(() {
            selectedCurrency = value;
          });
          getCoinPrices(currency: selectedCurrency);
        },
      );
    }
  }

  String priceToDescription({@required String crypto, @required String currency}) {
    final priceStr = price[crypto] == null || price[crypto].isNegative ? '?' : price[crypto].toString();
    return '1 $crypto = $priceStr $currency';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cryptoList
                  .map((crypto) => Card(
                        color: Colors.lightBlueAccent,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                          child: Text(
                            priceToDescription(crypto: crypto, currency: selectedCurrency),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: createPickerWidget(),
          ),
        ],
      ),
    );
  }
}

//https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD
