import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

import '../helper/global.dart';
import '../model/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    return message.msgType == MessageType.bot 
    
    //for bot 
    
    ? Row(children: [
     //spacing from corner left side 
       SizedBox(width: 6),

      CircleAvatar(
        radius: 18,
        backgroundColor: Colors.white,
        child: Image.asset('Assets/images/logo.png' , width: 24,),
        ),
       
       //container 
        Container(
           constraints: BoxConstraints(maxWidth: mq.width * .6),
          margin: EdgeInsets.only(bottom: mq.height *.02, left: mq.width * .02),
          padding: EdgeInsets.symmetric(
            vertical: mq.height * .01, horizontal: mq.width *.02),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).lightTextColor),
           borderRadius: BorderRadius.only(topLeft: r, topRight: r, bottomRight: r)),
          
          child: message.msg.isEmpty ? AnimatedTextKit(
  animatedTexts: [
    TypewriterAnimatedText(
      ' Please wait... ',
      speed: const Duration(milliseconds: 100),
    ),
  ],
  
              repeatForever: true,) 
                    :Text(
                        message.msg,
                          textAlign: TextAlign.center,
     ),
    )
    ]) 
    
    // for user 
    : Row(mainAxisAlignment: MainAxisAlignment.end,children: [
     
      //container 
        Container(
          constraints: BoxConstraints(maxWidth: mq.width * .6),
          margin: EdgeInsets.only(bottom: mq.height *.02, right: mq.width * .02),
          padding: EdgeInsets.symmetric(
            vertical: mq.height * .01, horizontal: mq.width *.02),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).lightTextColor),
           borderRadius: BorderRadius.only(topLeft: r, topRight: r, bottomLeft: r)),
          child: 
          Text(
            message.msg,
             textAlign: TextAlign.center
            )),
          

      CircleAvatar(
        radius: 18,
        backgroundColor: Colors.white,
        child: Icon(Icons.person, color: Colors.blue),
        ),

        //spacing from corner left side 
       SizedBox(width: 6),
    ]);
  }
}