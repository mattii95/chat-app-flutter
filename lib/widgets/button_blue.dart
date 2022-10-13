import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final String label;
  final Function() callback;
  const ButtonBlue({
    Key? key,
    required this.label,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: const StadiumBorder(),
      ),
      onPressed: callback,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
