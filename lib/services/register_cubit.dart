import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/services/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  RegisterCubit() : super(RegisterInitial());

  Future<void> signUpWithGmail(
      String email, String password, String fullName, String phone) async {
    emit(RegistarLoading());
    try {
      bool response =
          await _authService.signUpWithGmail(email, password, fullName, phone);
      if (response) {
        emit(RegistarSuccess());
      } else {
        emit(RegistarFailure("An unknown error occurred"));
      }
    } catch (e) {
      emit(RegistarFailure(e.toString()));
    }
  }
}
