import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:translator_plus/translator_plus.dart';

import '../helper/global.dart';

class APIs {
  // Get answer from ChatGPT
  static Future<String> getAnswer(String question) async {
  try{final res = await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        
        // Headers
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $apikey',
        },
        
        // Body
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "max_tokens": 2000,
          "temperature": 0, //0 means focused ,50 means bit focused bit creative , 100 creative middle values can also be used 
          "messages": [
            {"role": "user", "content": question},
          ],
        }),
      );

          final data = jsonDecode(res.body);

      // Check for successful response
     log('res: $data');
     return data['choices'][0]['message']['content'];} catch(e) {
      log('res: $e');
      log('getAnswerE: $e');
      return 'Something went wrong (Try again in sometime)';
     }
  }
   static  Future<List<String>> searchAiImages(String prompt) async{
      try{
      final res = await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));
      final data = jsonDecode(res.body);

      
        return List.from(data['images']).map((e) => e['src'].toString()).toList();
      } catch(e){
        log('searchAiImagesE: $e');
         return [];
      }
    }
 static Future<String> googleTranslate(
  {required String from, required String to, required String text })async{
    try{
      

  final res = await GoogleTranslator().translate(text, from: from, to: to);
      return res.text;
    }catch(e){
        log('googleTranslateE: $e');
         return 'Something Went Wrong!';
  }
}
}