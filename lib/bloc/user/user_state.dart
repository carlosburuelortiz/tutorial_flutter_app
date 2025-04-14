import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutorial_app/models/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserInitial;
  const factory UserState.loading() = UserLoading;
  const factory UserState.loaded(List<User> users) = UserLoaded;
  const factory UserState.error(String message) = UserError;
}
