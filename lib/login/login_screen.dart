import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/login/register_screen.dart';
import 'package:firebase/model/social_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/social_user_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();


  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e){
      print(e);

    };
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Login now to browser or hor offers",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: "E-mail Address",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text("Login"),
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                          } on FirebaseAuthException catch (e) {
                            print('hhhhhhhhhhh ${e.code}');
                          }
                          User user = FirebaseAuth.instance.currentUser!;
                          if (user.emailVerified == false) {
                            user.sendEmailVerification();
                          }
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account ?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegisterScreen()));
                          },
                          child: const Text("Register"))
                    ],
                  ),
                  ElevatedButton(onPressed: ()async{
                    UserCredential? cred=  await _signInWithGoogle();
                    print(cred);
                  }, child:const Text("google"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
