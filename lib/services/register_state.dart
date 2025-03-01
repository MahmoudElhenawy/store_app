part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegistarLoading extends RegisterState {}

final class RegistarSuccess extends RegisterState {}

final class RegistarFailure extends RegisterState {
  final String errMessage;

  RegistarFailure(this.errMessage);
}
