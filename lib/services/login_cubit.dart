import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/services/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  LoginCubit() : super(LoginInitial());

  Future<void> signInWithGmail(String email, String password) async {
    emit(LoginLoading());
    try {
      bool response = await _authService.signInWithGmail(email, password);
      if (response) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("خطأ في تسجيل الدخول، تحقق من البيانات."));
      }
    } catch (e) {
      emit(LoginFailure("حدث خطأ: ${e.toString()}"));
    }
  }
}
