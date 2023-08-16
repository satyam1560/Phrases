import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/repositiries/advice_repo.dart';
import 'package:dartz/dartz.dart';

import '../failure/failure.dart';

class AdviceUseCases {
  final AdviceRepo adviceRepo;

  AdviceUseCases({required this.adviceRepo});
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
    // //call a repsitory to get data(failure or data)
    // //proceed with business logic(manipulate the data)

    // await Future.delayed(const Duration(seconds: 1), () {});
    // // return right(const AdviceEntity(advice: ' advice to test', id: 1));
    // return left(CacheFailure());
  }
}
