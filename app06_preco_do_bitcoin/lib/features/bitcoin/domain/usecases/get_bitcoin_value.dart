import 'package:app06_preco_do_bitcoin/features/bitcoin/domain/entity/bitcoin_entity.dart';
import 'package:app06_preco_do_bitcoin/features/bitcoin/domain/repository/bitcoin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetBitcoinValue implements UseCase<BitcoinEntity> {
  final BitcoinRepository repository;

  const GetBitcoinValue({required this.repository});

  @override
  Future<Either<Failure, BitcoinEntity>> call() async{
    return await repository.getBitcoinValue();
  }
}
