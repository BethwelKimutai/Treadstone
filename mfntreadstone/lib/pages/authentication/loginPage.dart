import 'package:flutter/material.dart';
import 'package:mfntreadstone/components/mybutton.dart';
import 'package:mfntreadstone/components/mytextfield.dart';
import 'package:mfntreadstone/components/squareTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mfntreadstone/services/auth_services.dart';

class Loginpage extends StatefulWidget {
  final Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  //assigning controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //signin method
  void signUserIn() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try signin
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //WRONG EMAIL
      Navigator.pop(context);
      showErrorMesssage(e.code);
    }
  }

  // wrong email message popup
  void showErrorMesssage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.deepOrange,
              title: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 208),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 50),
              //icon label
              const Icon(
                Icons.lock,
                size: 100,
                color: Colors.red,
              ),

              const SizedBox(height: 50),
              //email textfielld
              Mytextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              //password textfield
              const SizedBox(height: 10),

              Mytextfield(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),

              const SizedBox(height: 10),
              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'forgot password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              //signin
              const SizedBox(height: 25),
              Mybutton(
                text: 'Sign In',
                onTap: signUserIn,
              ),

              //or continue with
              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              //google and apple signin
              const SizedBox(height: 50),

              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google signin
                  SquareTile(
                    onTap: () => AuthService().signInWithGoogle(),
                    imagepath: 'lib/images/googlelogo.png'),

                  const SizedBox(width: 25),
                  //apple signin
                  SquareTile(
                    onTap: () {
                      
                    },
                    imagepath: 'lib/images/applelogo.png')
                ],
              ),

              const SizedBox(height: 50),
              // not a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                      style: TextStyle(color: Colors.grey[700])),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
