import 'package:get_it/get_it.dart';
import 'package:tutorial_app/bloc/user/user_bloc.dart';
import 'package:tutorial_app/repositories/user_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository()
  );
  getIt.registerFactory(
    () => UserBloc(userRepository: getIt<UserRepository>())
  );
}
