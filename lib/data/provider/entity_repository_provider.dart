import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/provider/entity_remote_data_source.dart';
import 'package:keretaapp/data/repository/entity_repository.dart';
import 'package:keretaapp/data/repository/entity_repository_impl.dart';

final entityRepositoryProvider = Provider<EntityRepository>((ref) =>
    EntityRepositoryImpl(dataSource: ref.read(entityRemoteDataSourceProvider)));
