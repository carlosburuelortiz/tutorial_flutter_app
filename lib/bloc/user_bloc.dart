import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_app/repositories/user_repository.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    // ! WIP replace by function
    // ! WIP refactor code in a function
    on<LoadUserEvent>((event, emit) async {
      // I want to receive loaing state
      emit(UserLoading());

      try {
        final users = await userRepository.fetchUser();
        // I want to receive loaded users state
        emit(UserLoaded(users: users));
      } catch (e) {
        // I want to receive error users state
        emit(UserError(message: e.toString()));
      }
    });
  }
}
