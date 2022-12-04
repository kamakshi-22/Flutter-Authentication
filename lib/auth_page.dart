import 'package:aicte_app/widgets/login_widget.dart';
import 'package:aicte_app/widgets/signup_widget.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin 
      ? LoginWidget(onClickedSignUp: toggle) 
      : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() =>
    isLogin = !isLogin );
  
}
