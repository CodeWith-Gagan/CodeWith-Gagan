import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/model/home_type.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';
class HomeCard extends StatelessWidget {
  final HomeType  homeType;
   const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
        color: Colors.blue.withOpacity(.2),
        elevation: 0,
        margin: EdgeInsets.only(bottom: mq.height * .02),
        shape: const  RoundedRectangleBorder(
          borderRadius: BorderRadius.all
          (Radius.circular(20))),
        child: InkWell(
          borderRadius: BorderRadius.all(const Radius.circular(20)),
          onTap: homeType.onTap,
          child: homeType.leftAlign ? Row(
          children: [
            //lottie
              Container(
                width: mq.width * .35,
              padding: homeType.padding,
              child: Lottie.asset('Assets/lottie/${homeType.lottie}', ),
          ),
      
            Spacer(),
            
            //title
              Text(
               homeType.title, 
              style: TextStyle(
             fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1 ),
              ),
      
              Spacer(flex: 2),
      
            ],) :
            Row(
          children: [
      
            Spacer(flex: 2),
            
            //title
              Text(
               homeType.title, 
              style: TextStyle(
             fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1 ),
              ),
      
              Spacer(),
              //lottie
              Container(
                width: mq.width * .35,
              padding: homeType.padding,
              child: Lottie.asset('Assets/lottie/${homeType.lottie}', ),
          ),
      
        ],
      ),)
         ).animate().fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}