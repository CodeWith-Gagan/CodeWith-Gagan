



import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/apis.dart';
import 'package:flutter_application_1/helper/my_dialogs.dart';
import 'package:get/get.dart';
//import '../helper/global.dart';
enum Status {none, loading, complete}

class ImageController extends GetxController {
  final textC = TextEditingController();
  final status = Status.none.obs;

  final url = ''.obs;

  final imageList = <String>[].obs;
  
  
  Future<void> createAIImage() async {
   // OpenAI.apiKey = apikey; 
    if(textC.text.trim().isNotEmpty)  { 
      status.value = Status.loading;
       OpenAIImageModel image = await OpenAI.instance.image.create(
       prompt: textC.text,
        n: 1,
        size: OpenAIImageSize.size512,
         responseFormat: OpenAIImageResponseFormat.url,
);
        url.value = image.data[0].url.toString();
        status.value = Status.complete;
    }  else{
      MYDialog.info('Provide some beautiful image description!');
    }   
  }
  //  void downloadImage() async {
  //   try {
  //     //To show loading
  //     MYDialog.showLoadingDialog();

  //     log('url: $url');

  //     final bytes = (await get(Uri.parse(url))).bodyBytes; //provide image data in bytes 
  //     final dir = await getTemporaryDirectory();  //getting temporary directory
  //     final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes); //accessing the directory to get path

  //     log('filePath: ${file.path}'); // print the image 
  //     //save image to gallery
  //     await GallerySaver.saveImage(file.path, albumName: appName)
  //         .then((success) {
  //       //hide loading
  //       Get.back();

  //       MYDialog.success('Image Downloaded to Gallery!');
  //      });
  //    } catch (e) {
  //      //hide loading
  //      Get.back();
  //      MYDialog.error('Something Went Wrong (Try again in sometime)!');
  //      log('downloadImageE: $e');
  //    }
  //  }
    Future<void> searchAiImage() async{
      //if prompt is not empty
      if(textC.text.trim().isNotEmpty) {
    status.value = Status.complete;
    imageList.value = await APIs.searchAiImages(textC.text);
    if(imageList.isEmpty){
     MYDialog.error('Provide some beautiful image description!');
     return;
    }
    url.value = imageList.first;
    status.value = Status.complete;
      } else{
      MYDialog.info('Provide some beautiful image description!');
    }   
    }

}



