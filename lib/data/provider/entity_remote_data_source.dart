import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/provider/app_shared_preferences_provider.dart';
import 'package:keretaapp/data/provider/dio_provider.dart';
import 'package:keretaapp/data/remote/entity_remote_data_source.dart';
import 'package:keretaapp/data/remote/entity_remote_data_source_impl.dart';

final entityRemoteDataSourceProvider = Provider<EntityRemoteDataSource>((ref) =>
    EntityRemoteDataSourceImpl(ref.read(dioProvider), ref.read(prefsProvider)));
