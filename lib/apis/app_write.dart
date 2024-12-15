

import 'dart:developer';

import 'package:appwrite/appwrite.dart';

import '../helper/global.dart';

class AppWrite{
static final _client = Client();
static final _database = Databases(_client);
static void init(){
_client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('674b461f003c7ff75d0c')
      .setSelfSigned(status: true);
      getApiKey();

}
        static Future<String> getApiKey () async {
          try{
          final d = await _database.getDocument(
              databaseId: 'My Database', 
              collectionId: 'ApiKey', 
              documentId: 'ChatGptKey'
              );
              apikey = d.data['ApiKey'];
              log(apikey);
              return apikey;
          }
          catch(e){
            log('$e');
            return '';
          }
        }
}