import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../main.dart';

class LoginUser {
  Future<void> login(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (res.session != null) {
      //showToastMessage('Login Success', isError: false);
      //Navigator.push(BuildContext context, MaterialPageRoute(builder: ((context) => const RootApp())));
      //showToastMessage('Success', isError: false);
    } else if (res.session != null) {
      //showToastMessage('Error:${result.error!.message.toString()}',
      //isError: true);
    }
    final Session? session = res.session;
    final User? user = res.user;
  }
}
