import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/provider/user_remote_data_source_provider.dart';
import 'package:keretaapp/data/repository/user_repository.dart';
import 'package:keretaapp/data/repository/user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) =>
    UserRepositoryImpl(
        localDataSource: ref.read(userLocalDataSourceProvider),
        remoteDataSource: ref.read(userRemoteDataSourceProvider)));
