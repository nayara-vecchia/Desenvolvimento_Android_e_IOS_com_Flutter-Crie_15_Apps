// ignore: depend_on_referenced_packages
import 'package:app06_preco_do_bitcoin/features/bitcoin/data/datasource/bitcoin_datasource.dart';
import 'package:app06_preco_do_bitcoin/features/bitcoin/domain/usecases/get_bitcoin_value.dart';
import 'package:bloc/bloc.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

part 'bitcoin_state.dart';

class BitcoinCubit extends Cubit<BitcoinState> {
  final GetBitcoinValue getBitcoinValue;
  BitcoinCubit({required this.getBitcoinValue}) : super(const BitcoinInitial());

  void updateBitcoinPrice() async {
    emit(const BitcoinLoading());

    final result = await getBitcoinValue.call();
    result.fold(
      (failure) => emit(
        BitcoinError(
          failure.toString(),
        ),
      ),
      (bitcoinEntity) => emit(
        BitcoinLoaded(
          bitcoinValue: bitcoinEntity.lastValue.toString(),
        ),
      ),
    );
  }
}
