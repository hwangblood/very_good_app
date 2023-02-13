import 'package:equatable/equatable.dart';

class AuthError extends Equatable {
  const AuthError({
    this.title = 'Error',
    required this.text,
  });
  final String title;
  final String text;

  @override
  List<Object> get props => [title, text];
}
