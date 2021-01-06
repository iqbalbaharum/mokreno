import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/data/models/user.dart';
import 'package:keretaapp/data/provider/auth_repository_provider.dart';
import 'package:keretaapp/data/provider/user_repository_provider.dart';
import 'package:keretaapp/data/repository/auth_repository.dart';
import 'package:keretaapp/data/repository/user_repository.dart';

final appViewModelProvider = ChangeNotifierProvider((ref) => AppViewModel(
    ref.read(authRepositoryProvider), ref.read(userRepositoryProvider)));

class AppViewModel extends ChangeNotifier {
  final AuthRepository _authrepository;
  final UserRepository _userRepository;

  AppViewModel(this._authrepository, this._userRepository);

  void goToScreen(String to) async {
    if ((await _authrepository.loadJwt()).isEmpty) {
      Get.toNamed(Constants.pageSignIn);
      return;
    } else {
      if (to == Constants.pageSignIn) {
        Get.toNamed(Constants.pageHome);
        return;
      }
    }

    if ((await _userRepository.loadRoles()).isEmpty) {
      getUserSession();
      return;
    }

    Get.toNamed(to);
  }

  Future<void> signIn(String username, String password) async {
    return await _userRepository.signIn(username, password).then((result) {
      result.ifSuccess((data) {
        _authrepository.saveJwt(data.token);
        getUserSession();
        notifyListeners();
      });
    });
  }

  Future<void> getUserSession() async {
    return await _userRepository.me().then((result) {
      if (result.isFailure) {
        _userRepository.saveUserId('');
        _userRepository.saveName('');
        _userRepository.saveMobile('');
        _userRepository.saveEmail('');
        _userRepository.saveRoles([]);

        Get.toNamed(Constants.pageSignIn);
        notifyListeners();
        return;
      }

      result.ifSuccess((data) {
        _userRepository.saveUserId(data.user);
        _userRepository.saveName(data.name);
        _userRepository.saveMobile(data.mobile);
        _userRepository.saveEmail(data.email);
        _userRepository.saveRoles(data.roles);

        Get.offNamed(Constants.pageHome);
        notifyListeners();
      });
    }).catchError(() => {Get.toNamed(Constants.pageSignIn)});
  }
}
