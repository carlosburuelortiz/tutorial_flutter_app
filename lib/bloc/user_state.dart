import 'package:tutorial_app/models/user.dart';

sealed class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  UserLoaded({required this.users});
}

class UserError extends UserState {
  final String message;
  UserError({required this.message});
}
