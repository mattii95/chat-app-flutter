import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  final String title;
  const LoginLogo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/tag-logo.png')),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
