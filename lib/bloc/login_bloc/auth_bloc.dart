import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/bloc/login_bloc/auth_events.dart';
import 'package:task/bloc/login_bloc/auth_states.dart';
import 'package:task/model/auth/login_request.dart';
import 'package:task/utils/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/auth/registration_request.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginRequestEvent>(_loginRequest);
    on<RegistrationRequestEvent>(_registrationRequest);
    on<RegistrationButtonClickEvent>(_registration);
    on<LoginButtonClickEvent>(_login);
  }

  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//registration event
  void _registrationRequest(
      RegistrationRequestEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(
        registrationRequest: RegistrationRequest(
      name: event.registrationRequest.name,
      email: event.registrationRequest.email,
      password: event.registrationRequest.password,
      confirmPassword: event.registrationRequest.confirmPassword,
      phone: event.registrationRequest.phone,
    )));
  }

//login event
  void _loginRequest(LoginRequestEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        loginRequest: LoginRequest(
          email: event.loginRequest.email,
          password: event.loginRequest.password,
        ),
      ),
    );
  }

  //login button click
  Future<void> _registration(
      RegistrationButtonClickEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(registrationStatus: LoginStatus.loading));
      final newUser =await _auth
          .createUserWithEmailAndPassword(
              email: state.registrationRequest.email ?? "",
              password: state.registrationRequest.password ?? "")
          .then(
        (value) async {
          //store data
          await _firestore.collection('users').doc(value.user?.uid).set({
            'name': state.registrationRequest.name,
            'phone': state.registrationRequest.phone,
          });
          print("registration ${value.user}");
          emit(state.copyWith(
              registrationStatus: LoginStatus.success,
              message: "Registration Successfull"));
        },
      );
    } catch (e) {
      print("error ---------$e");
      emit(state.copyWith(
          registrationStatus: LoginStatus.error, message: "Registration Failed"));
    }
  }

  //login button click
  Future<void> _login(LoginButtonClickEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      final user =await _auth
          .signInWithEmailAndPassword(
              email: state.loginRequest.email ?? "",
              password: state.loginRequest.password ?? "")
          .then(
        (value) async {
          emit(state.copyWith(
              loginStatus: LoginStatus.success, message: "Login Successfull"));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.error, message: "Login Failed"));
    }
  }
}
