import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/global.dart';
import 'package:get/get.dart';

import '../helper/pref.dart';
import '../widget/custom_loading.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   super.initState();
    //wait for some time on splash  and move to next screen 
   Future.delayed(const Duration(seconds: 2), () { 
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => Pref.showOnboarding ? 
    //   const OnboardingScreen() : 
    //   const HomeScreen()));
    Get.off( () =>  Pref.showOnboarding 
    ?  const OnboardingScreen() 
    : const HomeScreen());
 });
  }
  @override
  Widget build(BuildContext context) {
  // initializing device size 
  mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body : SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            // for adding some space 
          const  Spacer(flex: 2),

            Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))), //round rectangle border
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05), // only card is changing not logo
                child: Image.asset('Assets/images/logo.png', width: mq.width * .45), // full changing with card and logo
              ), ),
          //// for adding some space 
        const  Spacer(),
          //lottie loading 
        const  CustomLoading(),
         // // for adding some space 
         const  Spacer(),

           ],
        ),
      ),
    );
    
  }
}

