import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lie_detector/utils/choices.dart';
import 'package:lie_detector/utils/custom_box.dart';

class ChosePage extends StatefulWidget {
  const ChosePage({super.key});

  @override
  State<ChosePage> createState() => _ChosePageState();
}

class _ChosePageState extends State<ChosePage> {
  Choices select = Choices.judge;
  final player = AudioPlayer();

  void onTapeFunction(Choices state) {
    setState(() {
      select = state;

      player.stop();
      if (select != Choices.judge) {
        player.play(findSound(select));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return select == Choices.judge ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: 
              GestureDetector(
                onTap: () => onTapeFunction(Choices.truth),
                child: CustomBox(
                  color: const Color.fromARGB(255, 13, 43, 15),
                  text: "Truth",
                ),
              )
            ),
            Expanded(child: 
              GestureDetector(
                onTap: () => onTapeFunction(Choices.lie),
                child: CustomBox(
                  color: const Color.fromARGB(255, 108, 17, 17),
                  text: "Lie",
                ),
              )
            )
          ],
        ),
        ) : Center(
      child: GestureDetector(
        onTap: () => onTapeFunction(Choices.judge),
        child: CustomBox(
          color: select == Choices.truth ? Colors.green : Colors.red,
          text: select == Choices.truth ? "Truth" : "Lie",
        ),
      ),
    );
  }
}