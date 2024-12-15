import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import '../helper/global.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 0,
         backgroundColor: Theme.of(context).buttonColor,
          textStyle: const TextStyle( fontSize: 18 , fontWeight: FontWeight.w500),
           minimumSize: Size(mq.width * .4,50)),
        onPressed: onTap,
        child:  Text(text)),
    );
  }
}