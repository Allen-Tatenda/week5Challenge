import 'package:flutter/material.dart';
import 'package:week5challenge/pages/auth/splash_screen.dart';
import 'package:week5challenge/theme/color.dart';
import 'package:week5challenge/utils/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: SupabaseGlobal().supabaseUrl, anonKey: SupabaseGlobal().supabaseKey);
  runApp(MyApp());
}

final supabase = Supabase.instance.client;
final signout = Supabase.instance.client.auth.signOut();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      home: const MySplashScreen(),
    );
  }
}
