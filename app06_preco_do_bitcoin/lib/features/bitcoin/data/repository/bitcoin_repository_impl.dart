import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entity/bitcoin_entity.dart';
import '../../domain/repository/bitcoin_repository.dart';
import '../datasource/bitcoin_datasource.dart';

class BitcoinRepositoryImpl implements BitcoinRepository {
  final BitcoinDataSource dataSource;

  BitcoinRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, BitcoinEntity>> getBitcoinValue() async {
    try {
      final result = await dataSource.getBitcoinValue();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
