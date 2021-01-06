import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/local/user_local_data_source.dart';
import 'package:keretaapp/data/local/user_local_data_source_impl.dart';
import 'package:keretaapp/data/provider/app_shared_preferences_provider.dart';
import 'package:keretaapp/data/provider/dio_provider.dart';
import 'package:keretaapp/data/remote/user_remote_data_source.dart';
import 'package:keretaapp/data/remote/user_remote_data_source_impl.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>(
    (ref) => UserRemoteDataSourceImpl(ref.read(dioProvider)));

final userLocalDataSourceProvider = Provider<UserLocalDataSource>(
    (ref) => UserLocalDataSourceImpl(ref.read(prefsProvider)));
