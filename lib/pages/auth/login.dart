import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:week5challenge/main.dart';
import 'package:week5challenge/pages/auth/signup.dart';
import 'package:week5challenge/pages/auth/splash_screen.dart';
import 'package:week5challenge/theme/color.dart';
import '../../widgets/progress_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (res.session != null) {
      //showToastMessage('Login Success', isError: false);
      // Navigator.push(context,
      //     MaterialPageRoute(builder: ((context) => const MySplashScreen())));
      //showToastMessage('Success', isError: false);
    } else if (res.session != null) {
      //showToastMessage('Error:${result.error!.message.toString()}',
      //isError: true);
    }
    final Session? session = res.session;
    final User? user = res.user;
  }

  loginUserNow(String email, String password) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Processing, Please wait...",
          );
        });

    final AuthResponse res = await supabase.auth
        .signInWithPassword(
      email: email,
      password: password,
    )
        .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: $msg", timeInSecForIosWeb: 5);
    });

    if (supabase.auth.currentUser != null) {
      final Session? session = supabase.auth.currentSession;
      final User? user = supabase.auth.currentUser;
      Fluttertoast.showToast(msg: "Login Successful.");
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
    } else {
      Fluttertoast.showToast(msg: "No record exist with this email.");
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.cardColor,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://www.circlefurniture.com/userfiles/images/alt-view-rooms/alt-room-view-nash-main.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.elliptical(2000, 200),
                          topRight: Radius.elliptical(10, 2000))),
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                //color: AppColor.cardColor.withOpacity(1),
                                gradient: LinearGradient(colors: [
                                  AppColor.cardColor.withOpacity(.5),
                                  AppColor.cardColor,
                                ], transform: GradientRotation(30)),
                                border:
                                    Border.all(color: Colors.black12, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                            color: AppColor.secondary,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        TextFormField(
                                          controller: emailController,
                                          decoration: const InputDecoration(
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                                color: AppColor.secondary),
                                            floatingLabelStyle: TextStyle(
                                                color: AppColor.secondary),
                                            icon: Icon(
                                              Icons.email,
                                              color: AppColor.secondary,
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColor.secondary,
                                                  width: 1.0),
                                            ),
                                          ),
                                          style: const TextStyle(
                                              color: AppColor.appBgColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 16.0),
                                        TextFormField(
                                          controller: passwordController,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                                color: AppColor.secondary),
                                            floatingLabelStyle: TextStyle(
                                                color: AppColor.secondary),
                                            icon: Icon(
                                              Icons.lock,
                                              color: AppColor.secondary,
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColor.secondary,
                                                  width: 1.0),
                                            ),
                                          ),
                                          style: const TextStyle(
                                              color: AppColor.appBgColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 16.0),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColor.secondary),
                                          ),
                                          onPressed: () {
                                            loginUserNow(emailController.text,
                                                passwordController.text);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Login'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Don\'t have an account ',
                                                style: TextStyle(
                                                    color: AppColor.darker),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                const RegisterPage())));
                                                  },
                                                  child: const Text(
                                                    'Register Here',
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.secondary,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
