import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';

import '../failure/failure.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource();
}
