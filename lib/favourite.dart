import 'package:flutter/material.dart';
import 'package:meditation_tracker/main.dart';
import 'package:meditation_tracker/meditation_data.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Favourites', style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.orange,
      ),
      body: Consumer<MeditationData>(
        builder: (context, data, child) {
          return ListView.builder(
            itemCount: data.favoriteRecords.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_formatTime(data.meditationRecords[index])),

                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    data.removeFromFavorites(index);
                  },
                ),
              );
            },
          );
        },
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
