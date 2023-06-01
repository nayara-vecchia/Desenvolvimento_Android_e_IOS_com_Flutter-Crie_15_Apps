part of 'bitcoin_cubit.dart';

@immutable
class BitcoinState {
  final String bitcoinValue;
  final bool isLoading;

  const BitcoinState({required this.bitcoinValue, required this.isLoading});
}