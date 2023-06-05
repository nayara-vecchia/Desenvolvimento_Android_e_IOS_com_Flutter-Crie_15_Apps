part of 'bitcoin_cubit.dart';

@immutable
abstract class BitcoinState {
  const BitcoinState();
}

class BitcoinInitial extends BitcoinState {
  const BitcoinInitial();
}

class BitcoinLoading extends BitcoinState{
  const BitcoinLoading();
}

class BitcoinLoaded extends BitcoinState{
  final String bitcoinValue;

  const BitcoinLoaded({required this.bitcoinValue}); 

}
class BitcoinError extends BitcoinState {
  final String message;

  const BitcoinError(this.message);
}