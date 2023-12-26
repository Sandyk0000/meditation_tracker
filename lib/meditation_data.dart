import 'package:flutter/material.dart';

class MeditationData extends ChangeNotifier {
  bool isRunning = false;
  int secondsElapsed = 0;
  List<int> meditationRecords = [];
  List<int> favoriteRecords = [];

  void startMeditation() {
    isRunning = true;
    notifyListeners();

    Future.delayed(Duration(seconds: 1), () {
      if (isRunning) {
        secondsElapsed++;
        startMeditation();
      }
    });
  }

  void stopMeditation() {
    isRunning = false;
    meditationRecords.add(secondsElapsed);
    secondsElapsed = 0;
    notifyListeners();
  }

  void addToFavorites(int record) {
    favoriteRecords.add(record);
    notifyListeners();
  }

  void removeFromFavorites(int index) {
    favoriteRecords.removeAt(index);
    notifyListeners();
  }
}