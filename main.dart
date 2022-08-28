import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordsextract/statecontroller.dart';
import 'package:wordsextract/statewidget.dart';
import 'package:wordsextract/wordbinding.dart';
import 'wordcontroller.dart';
import 'package:translator/translator.dart';
import 'package:english_words/english_words.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        //GetPage(name: "/", page: () => MyHomePage(), binding: wordbinding())
      ],
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  TextEditingController control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("hello")),
        bottomSheet: SmoothPageIndicator(
            controller: controller, // PageController
            count: 3,
            effect: SwapEffect(), // your preferred effect
            onDotClicked: (index) {
              controller.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticOut);
            }),
        body: PageView(
          controller: controller,
          children: [
            TextField(
              controller: control,
            ),
            GetBuilder(
                init: words(),
                builder: (words cont) => Column(
                      children: [
                        SizedBox(width: 200, height: 300, child: Data()),
                      ],
                    )),
            GetBuilder<words>(
                builder: (cont) => Column(
                      children: [
                        Container(
                          transform: Matrix4.rotationX(cont.angle)
                            ..rotateY(0.6)
                          ..rotateZ(0.6),
                          child: const Text("english words",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              '${cont.eng}',
                              textStyle: const TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          totalRepeatCount: 4,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        )
                      ],
                    ))
          ],
        ),
        floatingActionButton: ButtonBar(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.find<words>().findall(control.text);
                Get.find<words>().findall1(control.text);
                Get.find<words>().findall2(control.text);
                Get.find<words>().findwords1(control.text);
                Get.find<words>().findwords(control.text);
                Get.find<words>().findall3(control.text);
                Get.find<words>().findall4(control.text);
                Get.find<words>().findall5(control.text);
                Get.find<words>().findall6(control.text);
                Get.find<words>().findall7(control.text);
                Get.find<words>().findall8(control.text);
                Get.find<words>().findall9(control.text);
                Get.find<words>().english();
              },
              child: const Text("press again"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<words>().reset();
              },
              child: const Text("reset"),
            ),
          ],
        ),
      ),
    );
  }
}
