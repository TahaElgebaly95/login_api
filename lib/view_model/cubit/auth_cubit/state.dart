class AuthState{}

class InitLogin extends AuthState{}

class LoadingLoginState extends AuthState{}

class SuccessLoginState extends AuthState{}

class ErrorLoginState extends AuthState{}

class LoadingRegisterState extends AuthState{}

class SuccessRegisterState extends AuthState{}

class ErrorRegisterState extends AuthState{
  final String message;

  ErrorRegisterState(this.message);
}