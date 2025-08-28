import 'dart:math';

import 'package:riverpod/riverpod.dart';

final stockPriceProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 100; //Starting stock Price

  while (true) {
    await Future.delayed(Duration(seconds: 1));
    currentPrice += random.nextDouble() * 4 - 2;
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});
