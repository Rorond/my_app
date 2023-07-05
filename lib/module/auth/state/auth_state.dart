import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@unfreezed
class AuthState with _$AuthState {
  factory AuthState({
    @Default(true) bool status,
    @Default(false) bool isLoading,
    @Default("") String username,
    @Default("") String password,
  }) = _AuthState;
}
