class RegisterRequest {
  const RegisterRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.fullName,
    required this.address,
  });
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final String address;
  final String fullName;

  Map<String, dynamic> toMap() {
    return {
      'email': email.trim(),
      'password1': password.trim(),
      'password2': confirmPassword.trim(),
      'phone': phone.trim(),
      'name': fullName.trim(),
      'address': address.trim(),
    };
  }
}
