import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../model/social_user_model.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void userCreate({
    @required String? name,
    @required String? email,
    @required String? phone,
    @required String? uId,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );

    FirebaseFirestore.instance
        .collection("user")
        .doc(uId)
        .set(model.toMap())
        .then((value) => {})
        .catchError((error) {
      print("fireStore error $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    send() {
      var formDate = formState.currentState;
      if (formDate!.validate()) {
        print("valid");
      } else
        print("not valid");

      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => {
                userCreate(
                    uId: value.user?.uid,
                    phone: _phoneController.text,
                    email: _emailController.text,
                    name: _userController.text),
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()))
              })
          .catchError((error) {
        print("create error $error");
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register Screen"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Register now to browser or hor offers",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.length > 50) {
                          return "user name cant be more than 50 letter";
                        }
                        if (val.length < 2) {
                          return "user name cant be less than 2 letter";
                        }
                        return null;
                      },
                      controller: _userController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: "User Name",
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: .5),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.length > 50) {
                          return "e-mail cant be more than 50 letter";
                        }
                        if (val.length < 2) {
                          return "e-mail cant be less than 2 letter";
                        }
                        return null;
                      },
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
                      validator: (val) {
                        if (val!.length > 50) {
                          return "password cant be more than 50 letter";
                        }
                        if (val.length < 2) {
                          return "password cant be less than 2 letter";
                        }
                        return null;
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: .5),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.length > 50) {
                          return "phone cant be more than 50 letter";
                        }
                        if (val.length < 2) {
                          return "phone cant be less than 2 letter";
                        }
                        return null;
                      },
                      controller: _phoneController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          hintText: "phone",
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: .5),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: send,
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
