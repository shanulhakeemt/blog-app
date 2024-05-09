import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,required String password
  });
   Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,required String name
  });
}
