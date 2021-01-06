import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/data/local/app_shared_preferences.dart';
import 'package:keretaapp/data/models/entity.dart';
import 'package:keretaapp/data/models/entity_metadata.dart';
import 'package:keretaapp/data/provider/app_shared_preferences_provider.dart';
import 'package:keretaapp/data/provider/entity_repository_provider.dart';
import 'package:keretaapp/data/repository/entity_repository.dart';

final newRequestViewModelProvider = ChangeNotifierProvider((ref) =>
    NewRequestViewModel(
        ref.read(entityRepositoryProvider), ref.read(prefsProvider)));

class NewRequestViewModel extends ChangeNotifier {
  final EntityRepository _repository;
  final AppSharedPreferences _sharedPreferences;

  NewRequestViewModel(this._repository, this._sharedPreferences);

  Future<void> createEntity(String name, String phoneNo, String type,
      String plateNo, String transmission) async {
    EntityMetadata metadata =
        EntityMetadata(name, phoneNo, type, plateNo, transmission, '');

    Entity entity = Entity(
        'new',
        'new',
        (await this._sharedPreferences.getInstance()).getString('auth_uuid'),
        metadata);
    _repository.create(entity).then((value) => {
          value.ifSuccess((data) => {Get.offNamed(Constants.pageHome)})
        });
  }
}
