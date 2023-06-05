import 'package:app06_preco_do_bitcoin/features/bitcoin/domain/entity/bitcoin_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class BitcoinRepository {
  Future<Either<Failure, BitcoinEntity>> getBitcoinValue();
}