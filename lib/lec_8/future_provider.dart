import 'package:flutter_riverpod/flutter_riverpod.dart';

///Example to return simple int with FutureProvider
// final futureProvider = FutureProvider<int>((ref) async {
//   await Future.delayed(Duration(seconds: 2));
//   return 0;
// });

///Example to return List of String with FutureProvider
final futureProvider = FutureProvider<List<String>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return ['ABC', 'DEF', 'XYZ', 'PQR'];
});
