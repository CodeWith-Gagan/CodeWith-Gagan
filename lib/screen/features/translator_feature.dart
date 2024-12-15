import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/custom_button.dart';
import 'package:flutter_application_1/widget/language_sheet.dart';
import 'package:get/get.dart';
import '../../controller/image_controller.dart';
import '../../controller/translate_controller.dart';
import '../../helper/global.dart';
import '../../widget/custom_loading.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
final _c = TranslateController();  // creating instance of chat controller 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Multi Language Translator'),
        ),

        //body

        body: ListView( physics: BouncingScrollPhysics(),
             padding: EdgeInsets.only(
              top: mq.height * .02,
               bottom: mq.height * .1),
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,children: [

              // From language

              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c,s: _c.from)),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Obx(() => Text(_c.from.isEmpty ? 'Auto' : _c.from.value)),
                ),
              ),
                  //swap languages
                IconButton(onPressed: _c.swapLanguages,
                 icon: Obx(
                   () => Icon(
                    CupertinoIcons.repeat,
                    color: _c.to.isNotEmpty && _c.from.isNotEmpty ? Colors.blue:Colors.grey
                    ),
                 )),

              // To language
              
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c,s: _c.to)),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Obx(() => Text(_c.to.isEmpty ? 'To' : _c.to.value)),
                ),
              ),
            ]),

                //text field

            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height *.035),
              child: TextFormField(
                    controller: _c.textC,
                  
                  minLines: 5,
                  maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                hintText: 'Translate anything you want.... ',
                hintStyle: const TextStyle(fontSize: 13.5),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        ),
            ),


             //Result field
               
            Obx(() => _translateResult()),

                SizedBox(height: mq.height * .04),    // for space between boxes 
           
            CustomButton(
              onTap:_c.googleTranslate,
             // onTap:_c.translate,
               text: 'Translate'
               )
          ],
        ),
    );
  }


  Widget _translateResult()=> switch(_c.status.value) {
  Status.none =>   SizedBox(),
  Status.complete => Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: mq.width * .04,),
                child: TextFormField(
                      controller: _c.resultC,
                    maxLines: null,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                          ),
              ), 
   Status.loading => Align(child: CustomLoading())
};
}
