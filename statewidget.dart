import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:wordsextract/wordcontroller.dart';

class Data extends GetView<words> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          "permutations ${controller.strPermutations.length}",
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 300,
          height: 200,
          child: ListView.builder(
              itemCount: controller.strPermutations.length,
              itemBuilder: (BuildContext context, int index) => Text(
                    controller.strPermutations.elementAt(index),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  )),
        ),
      ],
    );
  }
}
