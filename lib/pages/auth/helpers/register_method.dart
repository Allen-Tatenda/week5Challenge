import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:week5challenge/widgets/progress_dialog.dart';

import '../../../main.dart';

class RegisterUser {
  Future register(
      String fullname, String email, String password, BuildContext c) async {
    showDialog(
        context: c,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Processing, Please wait...",
          );
        });
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'fullname': fullname},
    ).catchError((msg) {
      Navigator.pop(c);
      Fluttertoast.showToast(msg: "Error: $msg", timeInSecForIosWeb: 5);
    });
    ;
    final Session? session = res.session;
    final User? user = res.user;
  }
}
