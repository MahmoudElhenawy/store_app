import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/services/login_cubit.dart';
import 'package:store_app/widgets/Login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: const LoginViewBody(),
      ),
    );
  }
}
