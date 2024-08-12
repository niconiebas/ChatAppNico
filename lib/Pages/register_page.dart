import 'package:chatappnotification/Components/my_button.dart';
import 'package:chatappnotification/Components/my_textfield.dart';
import 'package:chatappnotification/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // email and pw controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPWController = TextEditingController();

  // to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get auth service

    final auth = AuthService();

    // if password match -> create user
    if (_pwController.text == _confirmPWController.text) {
      try {
        auth.signUpwithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
            context: context,
            builder: ((context) => AlertDialog(
                  title: Text(e.toString()),
                )));
      }
    }

    // if password dont match -> show error to fix
    else {
      showDialog(
          context: context,
          builder: ((context) => const AlertDialog(
                title: Text("Password don't match!"),
              )));
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
              // LOGO
              Icon(
                Icons.message,
                size: 120,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                height: 30,
              ),
              // Welcome back message
              Text(
                "Let's create an account for you!",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),

              const SizedBox(
                height: 25,
              ),

              // email textfield
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),

              const SizedBox(
                height: 10,
              ),

              // pw textfield
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: _pwController,
              ),

              const SizedBox(
                height: 10,
              ),

              // Confirm Password textfield
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: _confirmPWController,
              ),

              const SizedBox(
                height: 25,
              ),

              // login button
              MyButton(
                text: "Register",
                onTap: () => register(context),
              ),

              const SizedBox(
                height: 25,
              ),

              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
