import 'package:flutter/material.dart';
import 'package:week5challenge/pages/auth/login.dart';
import 'package:week5challenge/theme/color.dart';

import 'helpers/register_method.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                                color: AppColor.cardColor,
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
                                        'Register',
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
                                          controller: fullnameController,
                                          decoration: const InputDecoration(
                                            labelText: 'Username',
                                            labelStyle: TextStyle(
                                                color: AppColor.secondary),
                                            floatingLabelStyle: TextStyle(
                                                color: AppColor.secondary),
                                            icon: Icon(
                                              Icons.person,
                                              color: AppColor.secondary,
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColor.secondary,
                                                  width: 1.0),
                                            ),
                                          ),
                                          style: const TextStyle(
                                              color: AppColor.secondary),
                                        ),
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
                                              color: AppColor.secondary),
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
                                              color: AppColor.secondary),
                                        ),
                                        const SizedBox(height: 16.0),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColor.secondary),
                                          ),
                                          onPressed: () {
                                            RegisterUser().register(
                                                fullnameController.text,
                                                emailController.text,
                                                passwordController.text,
                                                context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Register'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Already have an account ',
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
                                                                const LoginPage())));
                                                  },
                                                  child: const Text(
                                                    'Login Here',
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
