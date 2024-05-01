import 'package:advicer/0_data/dataSource/advice_remote_datasource.dart';
import 'package:advicer/0_data/exception/exception.dart';
import 'package:advicer/1_domain/repositiries/advice_repo.dart';
import 'package:dartz/dartz.dart';

import '../../1_domain/entities/advice_entity.dart';
import '../../1_domain/failure/failure.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource;

  AdviceRepoImpl({required this.adviceRemoteDatasource});
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
