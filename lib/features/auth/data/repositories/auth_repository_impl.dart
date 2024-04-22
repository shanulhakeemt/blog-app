
import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(
     this.authRemoteDataSource,
  );

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final userId = await authRemoteDataSource.signUpWithEmailAndPassword(
          email: email, password: password, name: name);
      return right(userId);
    }on ServerException catch  (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
