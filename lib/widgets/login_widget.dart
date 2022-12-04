import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aicte_app/widgets/helper_widgets.dart';
import 'package:aicte_app/utils/styles.dart';
import 'package:aicte_app/main.dart';
import 'package:aicte_app/forgot_password_page.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              style: appTextFormFieldStyle,
              textInputAction: TextInputAction.next,
              decoration:
                  AppInputStyle.textFieldStyle(hintTextString: "Enter Email"),
            ),
            addVerticalSpace(24.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              cursorColor: Colors.white,
              style: appTextFormFieldStyle,
              textInputAction: TextInputAction.next,
              decoration: AppInputStyle.textFieldStyle(
                  hintTextString: "Enter Password"),
            ),
            addVerticalSpace(24.0),
            ElevatedButton.icon(
              onPressed: signIn,
              icon: const Icon(Icons.lock_open, size: 24),
              style: appButtonStyle,
              label: const Text('SIGN IN'),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Text(
                'Forgot Password?',
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: 'No account?   ',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up')
                ]))
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      const snackBar = SnackBar(
        content: Text('Error Signing In. Please Check email or password.'),
        backgroundColor: Colors.red,
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    //Navigator.of(context) not working
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
