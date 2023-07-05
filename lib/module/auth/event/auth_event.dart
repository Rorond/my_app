abstract class AuthEvent {}

class AuthIncrementEvent extends AuthEvent {}

class AuthLoadingEvent extends AuthEvent {}

class AuthLoadingCompleteEvent extends AuthEvent {}

class AuthChangeStatusEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {}
