import 'package:app06_preco_do_bitcoin/features/bitcoin/presentation/blocs/bitcoin_cubit.dart';
import 'package:app06_preco_do_bitcoin/features/bitcoin/presentation/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BitcoinScreen extends StatefulWidget {
  const BitcoinScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BitcoinScreen> createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BitcoinCubit, BitcoinState>(
      listener: (bitcoinCubitListenerContext, state) {
        if (state is BitcoinError) {
          ScaffoldMessenger.of(bitcoinCubitListenerContext).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: const Duration(milliseconds: 300),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset('assets/images/bitcoin.png'),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 300,
                  child: BlocBuilder<BitcoinCubit, BitcoinState>(
                    builder: (context, state) {
                      if (state is BitcoinLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is BitcoinLoaded) {
                        return Content(
                          bitcoinValue: state.bitcoinValue,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                Builder(
                  builder: (materialButtonContext) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<BitcoinCubit>(context).updateBitcoinPrice();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.amber.shade800,
                        ),
                        fixedSize: MaterialStateProperty.all(
                          const Size(200, 60),
                        ),
                      ),
                      child: const Text(
                        'Atualizar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
