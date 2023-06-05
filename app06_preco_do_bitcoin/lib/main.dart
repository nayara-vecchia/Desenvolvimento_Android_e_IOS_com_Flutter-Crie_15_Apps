import 'package:app06_preco_do_bitcoin/features/bitcoin/presentation/blocs/bitcoin_cubit.dart';
import 'package:app06_preco_do_bitcoin/features/bitcoin/presentation/screens/bitcoin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/bitcoin/data/datasource/bitcoin_datasource.dart';
import 'features/bitcoin/data/repository/bitcoin_repository_impl.dart';
import 'features/bitcoin/domain/repository/bitcoin_repository.dart';
import 'features/bitcoin/domain/usecases/get_bitcoin_value.dart';

void main() {
  final client = http.Client();
  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final http.Client client;
  const MyApp({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bitcoinDataSource = BitcoinDataSourceImpl(client: client);
    final getBitcoinValue = GetBitcoinValue(repository: BitcoinRepositoryImpl(bitcoinDataSource));
    final bitcoinCubit = BitcoinCubit(getBitcoinValue: getBitcoinValue);
    return BlocProvider(
      create: (context) => bitcoinCubit,
      child: MaterialApp(
        title: 'Preço do bitcoin',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const BitcoinScreen(
          title: 'Preço do bitcoin',
        ),
      ),
    );
  }
}
