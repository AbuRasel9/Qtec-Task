import 'package:equatable/equatable.dart';
import 'package:task/model/auth/login_request.dart';
import 'package:task/model/auth/registration_request.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequestEvent extends AuthEvent {
  const LoginRequestEvent({required this.loginRequest});

  final LoginRequest loginRequest;

  @override
  List<Object?> get props => [loginRequest];
}

class RegistrationRequestEvent extends AuthEvent {
  const RegistrationRequestEvent({required this.registrationRequest});

  final RegistrationRequest registrationRequest;

  @override
  List<Object?> get props => [registrationRequest];
}

class LoginButtonClickEvent extends AuthEvent {}
class RegistrationButtonClickEvent extends AuthEvent {}
