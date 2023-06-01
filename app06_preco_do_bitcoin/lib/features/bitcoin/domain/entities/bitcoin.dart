import 'package:equatable/equatable.dart';

class Bitcoin extends Equatable {
  final double last;
  final double buy;
  final double sell;
  final String symbol;

  const Bitcoin({
    required this.last,
    required this.buy,
    required this.sell,
    required this.symbol
  });

  @override
  List<Object?> get props => [last, buy, sell, symbol];
}