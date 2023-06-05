import '../../../../core/error/exceptions.dart';
import '../models/bitcoin_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

abstract class BitcoinDataSource {
  Future<BitcoinModel> getBitcoinValue();
}

class BitcoinDataSourceImpl implements BitcoinDataSource {
  final http.Client client;

  BitcoinDataSourceImpl({required this.client});

  @override
  Future<BitcoinModel> getBitcoinValue() async {
    final response = await client.get(Uri.parse(
        'https://blockchain.info/ticker'));
    if (response.statusCode == 200) {
      return BitcoinModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}