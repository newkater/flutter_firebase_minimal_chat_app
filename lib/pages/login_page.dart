import 'package:flutter/material.dart';
import 'package:flutter_firebase_minimal_chat_app/components/my_button.dart';
import 'package:flutter_firebase_minimal_chat_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  // login method
  void login() {}

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
              "Welcome back, you've been missed!",
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

            const SizedBox(height: 25),

            // login button
            MyButton(
              text: "Login",
              onTap: login,
            ),

            const SizedBox(height: 25),

            // register toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Register now!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
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