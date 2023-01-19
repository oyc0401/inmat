import 'package:flutter/material.dart';
import 'package:inmat/utils/inmat_colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.onclick,
    required this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String text;
  final VoidCallback onclick;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          height: 48,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.onclick,
  }) : super(key: key);

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Colorss.primaryColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colorss.primaryColor, width: 1.5),
      ),
      child: InkWell(
        onTap: onclick,
        borderRadius: BorderRadius.circular(14),
        child: const SizedBox(
          height: 50,
          child: Center(
            child: Text(
              "Log In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.onclick,
  }) : super(key: key);

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colorss.primaryColor, width: 1.5),
      ),
      child: InkWell(
        onTap: onclick,
        borderRadius: BorderRadius.circular(15),
        child: const SizedBox(
          height: 50,
          child: Center(
            child: Text(
              "회원가입",
              style: TextStyle(
                color: Colorss.primaryColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
