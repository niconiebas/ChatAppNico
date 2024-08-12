import 'package:chatappnotification/Components/my_button.dart';
import 'package:chatappnotification/Components/my_textfield.dart';
import 'package:chatappnotification/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // email and pw controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login method
  void login(BuildContext context) async {
    // auth serivce
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    }

    // catch any errors
    catch (e) {
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: ((context) => AlertDialog(
                title: Text(e.toString()),
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
                "Welcome back you have been missed!",
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
                height: 25,
              ),

              // login button
              MyButton(
                text: "Login",
                onTap: () => login(context),
              ),

              const SizedBox(
                height: 25,
              ),

              // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register now",
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
