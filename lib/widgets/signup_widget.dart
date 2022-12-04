import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aicte_app/widgets/helper_widgets.dart';
import 'package:aicte_app/utils/styles.dart';
import 'package:aicte_app/main.dart';
import 'package:aicte_app/utils.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                style: appTextFormFieldStyle,
                textInputAction: TextInputAction.next,
                decoration:
                    AppInputStyle.textFieldStyle(hintTextString: "Enter Email"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
              addVerticalSpace(24.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                cursorColor: Colors.white,
                style: appTextFormFieldStyle,
                textInputAction: TextInputAction.next,
                decoration: AppInputStyle.textFieldStyle(
                    hintTextString: "Enter Password"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Enter min. 6 characters'
                    : null,
              ),
              addVerticalSpace(24.0),
              ElevatedButton.icon(
                onPressed: signUp,
                icon: const Icon(Icons.arrow_forward, size: 24),
                style: appButtonStyle,
                label: const Text('SIGN UP'),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account?   ',
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Sign In')
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      const snackBar = SnackBar(
        content: Text('The email address is already in use by another account.'),
        backgroundColor: Colors.red,
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //Utils().showSnackBar(e.message);
      //Navigator.of(context) not working
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }
}
