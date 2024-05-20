import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  final void Function()? onFacebookPressed;
  final void Function()? onGmailPressed;
  final void Function()? onLinkedInPressed;

  const SocialLoginButtons({
    super.key,
    this.onFacebookPressed,
    this.onGmailPressed,
    this.onLinkedInPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'o ingresa con:',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset('assets/facebook.png'), 
              iconSize: 40,
              onPressed: onFacebookPressed,
            ),
            const SizedBox(width: 26),
            IconButton(
              icon: Image.asset('assets/gmail.png'), 
              iconSize: 40,
              onPressed: onGmailPressed,
            ),
            const SizedBox(width: 26),
            IconButton(
              icon: Image.asset('assets/linkedin.png'), 
              iconSize: 40,
              onPressed: onLinkedInPressed,
            ),
          ],
        ),
      ],
    );
  }
}
