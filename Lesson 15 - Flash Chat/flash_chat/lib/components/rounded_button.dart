import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final VoidCallback onPressed; //Function()? same

  const RoundedButton(this.title, this.backgroundColor, this.onPressed,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title),
        ),
      ),
    );
  }
}
