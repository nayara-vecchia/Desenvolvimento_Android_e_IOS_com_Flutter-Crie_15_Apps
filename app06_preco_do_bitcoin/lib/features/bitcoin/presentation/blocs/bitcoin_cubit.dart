// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

part 'bitcoin_state.dart';

class BitcoinCubit extends Cubit<BitcoinState> {
  BitcoinCubit()
      : super(
          const BitcoinState(bitcoinValue: '', isLoading: false),
        );

  void updateBitcoinPrice() async {
    final url = Uri.https('blockchain.info', '/ticker');
    emit(
      const BitcoinState(bitcoinValue: '', isLoading: true),
    );

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (response.statusCode >= 400) {
        emit(
          const BitcoinState(bitcoinValue: 'Failed', isLoading: false),
        );
      }
      if (response.statusCode == 200) {
        emit(
          BitcoinState(
              bitcoinValue: 'R\$ ${data['BRL']!['last'].toString()}',
              isLoading: false),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
