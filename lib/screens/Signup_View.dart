import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/services/register_cubit.dart';
import 'package:store_app/widgets/Signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static String id = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        // appBar: AppBar(
        //     automaticallyImplyLeading: false,
        //     title: const Customappbar(
        //       text: 'حساب جديد',
        //     )),
        body: const SignupViewBody(),
      ),
    );
  }
}
