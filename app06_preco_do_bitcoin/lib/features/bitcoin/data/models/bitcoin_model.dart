import 'package:app06_preco_do_bitcoin/features/bitcoin/domain/entity/bitcoin_entity.dart';

class BitcoinModel extends BitcoinEntity {
  BitcoinModel({required lastValue}) : super(lastValue: lastValue);

  factory BitcoinModel.fromJson(Map<String, dynamic> json) {
    return BitcoinModel(lastValue: json['BRL']['last']);
  }

  Map<String, dynamic> toJson() {
    return {
      'bitcoinValue': lastValue,
    };
  }
}