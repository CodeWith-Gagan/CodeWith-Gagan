import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/global.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widget/custom_button.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../model/onboard.dart';
import 'home_screen.dart';
class OnboardingScreen  extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      Onboard(
        title:  'Ask Me Anything', 
    subtitle: 'I Can Be Your Best Friend & You Can Ask Me Anything & I Will Help YOU!',
     lottie: 'ai_ask_me' ),
     //onboarding 2
     Onboard(
      title: 'Imagination To Reality',
      subtitle: 'Just imagine anything & let me know I will create something wonderful for you ', 
      lottie: 'ai_play')
      ];
    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length-1;
         return  Column(children: [
        Lottie.asset('Assets/lottie/${list[ind].lottie}.json', 
        height: mq.height * .6, width: isLast ? mq.width * .7 : null),
       // Title
           Text(
            list[ind].title, 
        style:
        const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: .5 ),  //text style
       ),
       
       // for adding some spaces
        SizedBox(height: mq.height * .015,),
       //subtitle
        SizedBox(
        width: mq.width * .7,
        child:  Text (
          list[ind].subtitle,
        textAlign: TextAlign.center,
        style:  TextStyle(
        fontSize: 13.5, letterSpacing: .5, color: Theme.of(context).lightTextColor),  //text style
      ),
    ),
          const Spacer(),

       //dots
      Wrap(
        spacing: 10,
        children: List.generate(
          list.length,
           (i) => Container(
          width: i == ind ? 15:10 ,
           height: 8, 
           decoration:  BoxDecoration(
            color: i == ind ? Colors.blue : Colors.grey, 
            borderRadius:  const BorderRadius.all(Radius.circular(5))),
            )),
            ),
        
        const Spacer(),
       //button
       CustomButton(onTap: () {
          if(isLast){
            Get.off(() => const HomeScreen ());
           // Navigator.of(context).pushReplacement(MaterialPageRoute(
           //   builder: (_) => const HomeScreen()));
          }else{
            c.nextPage(duration: const Duration(milliseconds: 600),
             curve: Curves.ease);
          }
        }, text:  isLast  ? 'Finish' : 'Next'),
    
       const Spacer(flex: 2,),
       ],
        );
           },
        ),
    );
}
}