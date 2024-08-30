import 'package:flutter/material.dart';
import 'package:flutter_firebase_minimal_chat_app/auth/auth_service.dart';
import 'package:flutter_firebase_minimal_chat_app/components/my_button.dart';
import 'package:flutter_firebase_minimal_chat_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // tap to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get auth service
    final _authService = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _authService.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
      }
      catch (e) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    else {
      showDialog(
        context: context, 
        builder: (context) => const AlertDialog(
          title: Text("Passwords dont match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message, 
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextfield(
              hintText: "email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            // password textfield
            MyTextfield(
              hintText: "password",
              obscureText: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 10),

            // confirm password textfield
            MyTextfield(
              hintText: "confirm password",
              obscureText: true,
              controller: _confirmPasswordController,
            ),

            const SizedBox(height: 25),

            // login button
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            // register toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}