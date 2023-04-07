// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData rate = CoinData();
  String btcPrice = '?';
  String ethPrice = '?';
  String currency = 'AUD';
  String? lastUpdated;

  @override
  void initState() {
    super.initState();

    updateUI();
  }

  void updateUI() async {
    var data = await rate.getRate(currency);
    if (data == null) return;

    setState(() {
      btcPrice = data["BTC"]["rate"];
      ethPrice = data["ETH"]["rate"];
      lastUpdated = data["time"]["time"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💲 Talon\'s Crypto Tracker 💲'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.black38,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 BTC = $btcPrice $currency',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.black38,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 ETH = $ethPrice $currency',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Text(
                    'Last Updated At: $lastUpdated',
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 100.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20.0),
              color: Colors.black38,
              child: DropdownButton<String>(
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                menuMaxHeight: 200.0,
                enableFeedback: true,
                value: currency,
                items: currenciesList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    currency = value!;
                    updateUI();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
