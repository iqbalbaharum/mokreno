import 'package:hooks_riverpod/all.dart';
import 'package:keretaapp/data/local/theme_data_source_impl.dart';

import 'app_shared_preferences_provider.dart';

final themeDataSourceProvider =
    Provider((ref) => ThemeDataSourceImp(ref.read(prefsProvider)));
