import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lie_detector/utils/choices.dart';
import 'package:lie_detector/utils/custom_box.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  Choices select = Choices.judge;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return select == Choices.judge ? Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            select = Choices.truth;
            if (Random().nextBool()) {
              select = Choices.lie;
            }
            player.play(findSound(select));
          });
        },
        child: CustomBox(
          color: const Color.fromARGB(255, 39, 39, 39),
          text: "Judge",
        ),                
      ),
    ) : Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            player.stop();
            select = Choices.judge;
          });
        },
        child: CustomBox(
          color: select == Choices.truth ? Colors.green : Colors.red,
          text: select == Choices.truth ? "Truth" : "Lie",
        ),  
      ),
    );
  }
}
