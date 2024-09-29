import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class UserLogin {
  final AuthRepository authRepository;

  const UserLogin({required this.authRepository});

  Future<Either<Failure, String>> execute(String email, String password) async {
    return await authRepository.authLogin(email, password);
  }
}