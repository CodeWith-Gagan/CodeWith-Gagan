import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/apis.dart';
import 'package:flutter_application_1/helper/my_dialogs.dart';
import 'package:get/get.dart';

import '../model/message.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();

  final scrollC = ScrollController();

  final list = <Message>[
    Message(msg: 'Hello How can I Help you?', msgType: MessageType.bot)

  ].obs;

  Future<void> askQuestion() async {
    if(textC.text.trim().isNotEmpty)  { //removing white spaces from string from side not centre because user send space not want to send to ai bot 
    //user
    list.add(Message(msg: textC.text, msgType: MessageType.user));//what user type that should be only the message not other things
    list.add(Message(msg: '', msgType: MessageType.bot)); // dummy message till original message is received 
    _scrollDown();
   
   //calling
   final res = await APIs.getAnswer(textC.text);


   //ai bot
   list.removeLast();// for removing dummy message 
    list.add(
      Message(msg: res, msgType: MessageType.bot));
      _scrollDown();

      textC.text = ''; //clear keyboard text after getting response
    } else{
      MYDialog.info('Ask Something!');
    }      
  }
       // for moving to bottom end message 
       void _scrollDown(){
        scrollC.animateTo(
          scrollC.position.maxScrollExtent, 
          duration: Duration(milliseconds: 500), 
          curve: Curves.ease
          );
       }

}



