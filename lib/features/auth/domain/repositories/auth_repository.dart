import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> authLogin(String email, String password);
  Future<void> authSetUrl(String url);
}