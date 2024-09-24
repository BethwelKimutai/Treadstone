import 'package:flutter/material.dart';
import 'package:mfntreadstone/components/mybutton.dart';
import 'package:mfntreadstone/components/mytextfield.dart';
import 'package:mfntreadstone/components/squareTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mfntreadstone/services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //assigning controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //signin method
  void signUserUp() async {
  //show loading circle
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

  try {
    //check if passwords match
    if (passwordController.text == confirmPasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //pop the loading circle
      Navigator.pop(context);
      // The StreamBuilder in AuthPage will now redirect the user to HomePage
    } else {
      //show error message, passwords don't match
      Navigator.pop(context);
      showErrorMesssage("Passwords don't match!");
    }
  } on FirebaseAuthException catch (e) {
    //pop the loading circle
    Navigator.pop(context);

    //show error message
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

              //confirm password textfield
              const SizedBox(height: 10),

              Mytextfield(
                controller: confirmPasswordController,
                hintText: 'Confirm password',
                obscureText: true,
              ),

              //signin
              const SizedBox(height: 25),
              Mybutton(
                text: 'Sign Up',
                onTap: signUserUp,
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
                      'Or login with',
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
                  SquareTile(onTap: () {
                    
                  },
                    imagepath: 'lib/images/applelogo.png')
                ],
              ),

              const SizedBox(height: 50),
              // not a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a member?',
                      style: TextStyle(color: Colors.grey[700])),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'login',
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
