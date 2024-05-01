import 'package:advicer/0_data/dataSource/advice_remote_datasource.dart';
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/repositiries/advice_repo.dart';
import 'package:advicer/1_domain/usecases/advice_usecase.dart';
import 'package:advicer/pages/advice/bloc/advicer_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;
//*---- sl is service locator
Future<void> init() async {
  //!---- application layer
  //*---- Factory=every time a new/fresh instance of that class
  sl.registerFactory(() => AdvicerBloc(adviceUseCases: sl()));
  //!---- domain layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));
  //!---- data layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));
  //!---- externs
  sl.registerFactory(() => http.Client());
}
