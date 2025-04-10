import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

enum Choices {
  judge,
  truth,
  lie,
}

AssetSource findSound(Choices choice) {
  switch (choice) {
    // case Choices.judge:
    //   break;
    case Choices.truth:
      return AssetSource('sounds/truth.wav');
    case Choices.lie:
      return AssetSource('sounds/lie.wav');
    default:
      return AssetSource('sounds/truth.wav');
  }
}