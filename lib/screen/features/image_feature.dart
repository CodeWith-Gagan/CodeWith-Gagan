import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/image_controller.dart';
import 'package:flutter_application_1/widget/custom_button.dart';
import 'package:flutter_application_1/widget/custom_loading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../helper/global.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c = ImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AI Image Creator'),

        //share button
        actions: [Obx(
          () => _c.status.value == Status.complete ? IconButton(
              padding: EdgeInsets.only(right: 6) ,
              onPressed: (){
          
            }, icon: Icon(Icons.share))
            : SizedBox(),
        )
      ],
     ),
            //download button
             //download btn
      floatingActionButton:  
        Padding(
                padding:  EdgeInsets.only(right: 6, bottom:6),
                child: FloatingActionButton(
                  onPressed: (){
                    //
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Icon(Icons.save_alt_rounded, size: 26),
                ),
              ),
        
        body: ListView(
            physics: BouncingScrollPhysics(),
             padding: EdgeInsets.only(
              top: mq.height * .02,
               bottom: mq.height * .1,
                left: mq.width * .04, 
                right: mq.width *.04 ),
                children: [
                  
                  //text field 
                
                TextFormField(
                  controller: _c.textC,
                textAlign: TextAlign.center,
                minLines: 2,
                maxLines: null,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: 'Imagine something wonderful and innovative\nType here and i will create for you 😃',
              hintStyle: const TextStyle(fontSize: 13.5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          ),

            // ai image 
        
        Container(
          height: mq.height*.486,
          margin: EdgeInsets.symmetric(vertical: mq.height * .015),
          alignment: Alignment.center,
          child: 
          Obx(() => _aiImage())),
          
          
          Obx(() => _c.imageList.isEmpty ? SizedBox(): SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: mq.height * .015),
            physics: BouncingScrollPhysics(),
            child: Wrap(
              spacing: 8,
              children: _c.imageList.map((e) => InkWell(
                onTap: () {
                  _c.url.value = e;
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                              imageUrl: e,
                              height: 100,
                              errorWidget: (context, url, error) => SizedBox(),
                       ),
                ),
              )).toList(),),
          )),


            // create button (btn)
           // CustomButton(onTap: _c.createAIImage, text: 'Create'),
            CustomButton(onTap: _c.searchAiImage, text: 'Create'),
            
          ],
        ),
    );
  }


  Widget _aiImage()=> ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(10)),  //clipRReact can make any border curve 
    child: switch(_c.status.value){
      Status.none =>   Lottie.asset('Assets/lottie/ai_play.json', height: mq.height * .3),
      Status.complete => CachedNetworkImage(
          imageUrl: _c.url.value,
          placeholder: (context, url) => CustomLoading(),
          errorWidget: (context, url, error) => SizedBox(),
       ),
       Status.loading => CustomLoading()
    },
  );
   
}