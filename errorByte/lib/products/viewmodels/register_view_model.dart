// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stack_overflow_clone/core/base/base_singleton.dart';
import 'package:stack_overflow_clone/core/helpers/api.dart';

import '../views/auth/login_view.dart';

class RegisterViewModel extends ChangeNotifier with BaseSingleton {
  final _api = Api();

  Future<int> register({
    required String name,
    required String lastname,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String url = "/auth/register";
    final result = await _api.dioPost(
      url: url,
      obj: {
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
      },
      useToken: false,
    );

    globals.getAlertDialog(
      context: context,
      result: result,
      successTitle: "Register Successful",
      fail400Title: "SomeThing Went Wrong!",
      fail500Title: "Register Fail",
      onTap: () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => LoginView(),
        ),
        (route) => false,
      ),
    );

    return result?.statusCode ?? 500;
  }
}
