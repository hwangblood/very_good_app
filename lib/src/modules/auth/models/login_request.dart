class LoginRequest {
  const LoginRequest(this.email, this.password);
  final String email;
  final String password;

  Map<String, dynamic> toMap() =>
      {'email': email.trim(), 'password': password.trim()};
}
