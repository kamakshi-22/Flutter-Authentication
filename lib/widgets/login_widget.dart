import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 80,),
            Image.asset('assets/images/AICTE-logo.png'),
            Image.asset('assets/images/AICTE-text.png'),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration:
                  const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 4,),
            TextField(
              controller: passwordController,
              obscureText: true,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration:
                  const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)
              ),
              onPressed: signIn,
              icon: const Icon(Icons.lock_open, size: 20, color: Colors.white,),
              label: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20),
                ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: Colors.teal,
                      fontWeight: FontWeight.w500,
                      ),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage(),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?  ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16
                      ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500,
                      )
                      
                      )
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
        content: Text(
          'Error Signing In. Please Check your email or password.',
          style: TextStyle(
            color: Colors.white
          ),
          ),
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
