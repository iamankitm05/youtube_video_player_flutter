import 'package:flutter/material.dart';
import 'package:youtube_video_player_flutter/youtube_player_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube Videos'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: youtubeVideos.length,
        itemBuilder: (context, index) {
          final youtubeVideo = youtubeVideos[index];
          return Card(
            child: ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return YoutubePlayerDialog(
                      title: youtubeVideo[0],
                      videoId: youtubeVideo[1],
                    );
                  },
                );
              },
              leading: Image.network(
                'https://img.youtube.com/vi/${youtubeVideo[1]}/0.jpg',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image, size: 60, color: Colors.red);
                },
              ),
              title: Text(
                youtubeVideo[0],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  /// Youtube Video name and id [Name, Id]
  ///
  static const youtubeVideos = [
    [
      'Vaaste Song: Dhvani Bhanushali, Tanishk Bagchi | Nikhil D\'Souza',
      'BBAyRBTfsOU',
    ],
    [
      'Main Likh Dun Aasman Par Yeh | SANAM RE | Pulkit Samrat, Urvashi Rautela |Armaan Malik,Palak Muchhal',
      'ULn0NFzwfPg',
    ],
    [
      'Arijit Singh - Mareez - E - Ishq | ZiD | Mannara Chopra | Karanvir | Sharib - Toshi',
      'WxEmaBaLHVk',
    ],
    [
      'Aankhon Mein Aansoon | Ek Haseena Thi Ek Deewana Tha | New Hindi Songs 2017 | Nadeem, Palak, Yasser',
      'izP81UySf0Y',
    ],
    [
      'Barsaat Ki Dhun Song | Rochak K Ft. Jubin N | Gurmeet C, Karishma S |Rashmi V | Ashish P | Bhushan K',
      'YIucrdfR6rI',
    ],
  ];
}
