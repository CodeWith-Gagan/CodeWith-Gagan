
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/translate_controller.dart';
import 'package:get/get.dart';

import '../helper/global.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateController c;
  final RxString s;
  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
 final _search  = ''.obs;
  @override
  Widget build(BuildContext context) {
      

    return Container(
      padding: EdgeInsets.only(left:  mq.width * .04, right: mq.width *.04, top:  mq.height * .02),
      height: mq.height * .5,
      decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),

      child: Column(children: [
        TextFormField(
                   // controller: _c.resultC,
                   onChanged: (s) => _search.value = s.toLowerCase(),
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.translate_rounded, color: Colors.blue),
                hintText: 'Search Language...',
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                        ),
                
                // List View Builder bottom sheet
                Expanded(
                  child: Obx(
                    () {
                      final List<String> list = _search.isEmpty 
                      ? widget.c.lang 
                       : widget.c.lang.where((e) =>
                        e.toLowerCase().contains(_search.value)).toList();
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                      itemCount: list.length,
                      padding: EdgeInsets.only(top: mq.height * .02, left: 6),
                      itemBuilder: (ctx, index){
                      return InkWell(
                        onTap: (){
                         widget.s.value = list[index];
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: mq.height * .02),
                          child: Text(list[index]),
                        ),
                      );
                    },
                                 );
                    },
                  ),
                )
      ],
      
      ),
    );
  }
}

