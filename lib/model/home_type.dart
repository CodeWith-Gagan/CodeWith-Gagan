
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/features/chatbot_feature.dart';
import 'package:flutter_application_1/screen/features/translator_feature.dart';
import 'package:get/get.dart';

import '../screen/features/image_feature.dart';

enum HomeType {aiChatbot, aiImage, aiTranslator}

extension MyHomeType on HomeType{
// title

String get title => switch (this) {
  
   HomeType.aiChatbot => 'Ai ChatBot',
   HomeType.aiImage => 'Ai Image Creator',
   HomeType.aiTranslator => 'Language Translator',
};
 // lottie

 String get lottie => switch (this) {
  
  HomeType.aiChatbot => 'ai_hand_waving.json',
  HomeType.aiImage => 'ai_play.json',
  HomeType.aiTranslator => 'ai_ask_me.json',
};

// for alignment
bool get leftAlign => switch(this){

  HomeType.aiChatbot => true,
  HomeType.aiImage => false,
  HomeType.aiTranslator => true,
};

// for padding
EdgeInsets get padding => switch(this){

  HomeType.aiChatbot => EdgeInsets.zero,
  HomeType.aiImage => EdgeInsets.all(20),
  HomeType.aiTranslator => EdgeInsets.zero,
};

VoidCallback get onTap => switch(this){

  HomeType.aiChatbot => () => Get.to(() => const ChatBotFeature()),
  HomeType.aiImage => () => Get.to(() => const ImageFeature()),
  HomeType.aiTranslator => () => Get.to(() => const TranslatorFeature()),
};

}
