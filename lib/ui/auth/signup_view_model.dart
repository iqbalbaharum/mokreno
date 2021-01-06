import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/constant.dart';
import 'package:keretaapp/data/provider/user_repository_provider.dart';
import 'package:keretaapp/data/repository/user_repository.dart';

final signUpViewModelProvider = ChangeNotifierProvider(
    (ref) => SignUpViewModel(ref.read(userRepositoryProvider)));

class SignUpViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  SignUpViewModel(this._userRepository);

  Future<void> signUp(username, email, mobile, password) async {
    _userRepository.signUp(username, email, mobile, password).then((result) {
      result.ifSuccess((data) {
        Get.offNamed(Constants.pageSignIn);
        notifyListeners();
      });
    });
  }
}
