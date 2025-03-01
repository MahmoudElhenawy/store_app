import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/register_cubit.dart';
import 'package:store_app/widgets/Terms_Conditions.dart';
import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_text_filed.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/widgets/custom_snackbar.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email;
  bool isLoading = false;
  String? password;
  bool isAccepted = false;
  String? name;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 120,
                    ),
                  ),
                  Text(
                    "Create New Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Full Name',
                    hintText: 'Full Name',
                    onChanged: (value) => name = value,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labelText: 'Email',
                    hintText: 'Email',
                    onChanged: (value) => email = value,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    isPassword: true,
                    labelText: 'Password',
                    hintText: 'Password',
                    //isPassword: true,
                    onChanged: (value) => password = value,
                  ),
                  const SizedBox(height: 10),
                  TermsConditions(
                    onChanged: (value) => isAccepted = value,
                  ),
                  const SizedBox(height: 20),
                  customButton(
                    text: "Sign Up",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (isAccepted) {
                          BlocProvider.of<RegisterCubit>(context)
                              .signUpWithGmail(
                                  email!, password!, name!, "123456789");
                        } else {
                          CustomSnackBar.show(context,
                              "You must accept the terms and conditions");
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is RegistarFailure) {
          isLoading = false;
          CustomSnackBar.show(context, state.errMessage);
        } else if (state is RegistarSuccess) {
          isLoading = false;
          CustomSnackBar.show(context, "Registration Successful");
          Navigator.pushReplacementNamed(context, HomePage.id);
        } else if (state is RegistarLoading) {
          isLoading = true;
        }
      },
    );
  }
}
