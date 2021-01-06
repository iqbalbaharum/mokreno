import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/local/auth_data_source_impl.dart';
import 'package:keretaapp/data/provider/app_shared_preferences_provider.dart';

final authDataSourceProvider =
    Provider((ref) => AuthDataSourceImpl(ref.read(prefsProvider)));
