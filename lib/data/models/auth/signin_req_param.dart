

class SignInReqParam {
  final String email;
  final String password;

  SignInReqParam({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password};
  }
}
