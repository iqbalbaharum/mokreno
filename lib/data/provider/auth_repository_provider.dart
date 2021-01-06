import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/provider/app_shared_preferences_provider.dart';
import 'package:keretaapp/data/provider/auth_data_source_provider.dart';
import 'package:keretaapp/data/repository/auth_repository_impl.dart';

final authRepositoryProvider = Provider(
    (ref) => AuthRepositoryImpl(dataSource: ref.read(authDataSourceProvider)));
