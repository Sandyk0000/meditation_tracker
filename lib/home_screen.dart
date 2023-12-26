import 'package:flutter/material.dart';
import 'package:meditation_tracker/favourite.dart';

import 'package:meditation_tracker/meditation_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Meditation Tracker App', style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 201, 199, 199),
              padding: EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  Consumer<MeditationData>(
                    builder: (context, data, child) {
                      return Text(
                        _formatTime(data.secondsElapsed),
                        style: TextStyle(fontSize: 26),
                      );
                    },
                  ),
                  SizedBox(height: 60),
                  Consumer<MeditationData>(
                    builder: (context, data, child) {
                      return ElevatedButton(
                        onPressed: () {
                          if (data.isRunning) {
                            data.stopMeditation();
                          } else {
                            data.startMeditation();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                        child: Text(
                          data.isRunning ? 'Stop' : 'Start',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );

                    },
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
            
           
            Expanded(
              child: Consumer<MeditationData>(
                builder: (context, data, child) {
                  return ListView.builder(
                    itemCount: data.meditationRecords.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_formatTime(data.meditationRecords[index])),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                data.addToFavorites(
                                    data.meditationRecords[index]);
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                data.meditationRecords.removeAt(index);
                                data.notifyListeners();
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 23, 91, 201),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
           
            
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 238, 236, 236),
              padding: EdgeInsets.all(6.0),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoritesScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.orange,
                    ),
                  ),
                  Text("Favourites"),
                  
                ],
              ),
            ),
            // SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;
    final int remainingSeconds = seconds % 60;

    return '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
