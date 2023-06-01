import 'package:app06_preco_do_bitcoin/features/bitcoin/presentation/blocs/bitcoin_cubit.dart';
import 'package:app06_preco_do_bitcoin/features/bitcoin/presentation/screens/bitcoin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BitcoinCubit(),
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
