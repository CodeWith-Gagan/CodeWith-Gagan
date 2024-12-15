import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/chat_controller.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widget/message_card.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _c = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //app bar 
        appBar: AppBar(title: const Text('Chat with AI Assistant'),
        ),

        //send message field and btn
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            //text input field
            Expanded(
              child: TextFormField(
                controller: _c.textC,
                textAlign: TextAlign.center,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              filled: true,
              isDense: true,
              hintText: 'Ask me anything you want.....',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
          )),
      //for adding some spaces 
      const SizedBox(width: 8,),

      //send button
      CircleAvatar(
        radius: 24,
        backgroundColor: Theme.of(context).buttonColor,
        child: IconButton(
        onPressed: _c.askQuestion, //notation used to pass function 
        icon: Icon(
          Icons.rocket_launch_rounded,
         color:Colors.white,  size: 28),
      ),
      )

          ],),
        ),
        

        //body
        body: Obx(
          () => ListView(
            physics: BouncingScrollPhysics(),
            controller: _c.scrollC,
            padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1 ),
         children: _c.list.map((e) => MessageCard(message: e)).toList(),
          )
    ),
    );
  }
}