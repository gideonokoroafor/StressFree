import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/StressFreeModel.dart';

class VideoPlayer extends StatefulWidget {
  final String collectionPath;
  const VideoPlayer({Key? key, required this.collectionPath}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late Color _iconColor;
  late YoutubePlayerController _controller;
  final modelReference = new StressFreeModel();

  // bool isFullScreen = false;

  // @override
  // void initState() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //   ]);
  //   AutoOrientation.landscapeAutoMode();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(widget.collectionPath)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            String collection = widget.collectionPath.toString();
            if (!snapshot.hasData) return const Text('Loading...');
            return Expanded(
              child: ListView(
                children: snapshot.data!.docs.map<Widget>((document) {
                  var url = document['url'];
                  _controller = YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(url)!,
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                      isLive: false,
                      loop: false,
                      forceHD: false,
                      controlsVisibleAtStart: false,
                    ),
                  );
                  return Card(
                    child: YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: _controller,
                      ),
                      builder: (context , player) {
                        return Column(
                          children: [
                            player,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10),
                                    child: Text(document['name'],
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                ),

                                // IconButton(
                                //     onPressed: (){
                                //       AutoOrientation.landscapeLeftMode();
                                //       // _controller.toggleFullScreenMode();
                                //       // _enableFullscreen(!isFullScreen);
                                //       },
                                //     icon: Icon(
                                //       Icons.fullscreen,
                                //     )
                                // ),

                                IconButton(
                                  icon: Icon(
                                    Icons.bookmark,
                                    size: 30.0,
                                    color: _iconColor = document['isFavorite']
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    if (_iconColor == Colors.grey) {
                                      FirebaseFirestore.instance
                                          .collection(collection)
                                          .doc(document['name'])
                                          .update({'isFavorite': true});
                                      setState(() {
                                        //color:
                                        _iconColor = document['isFavorite']
                                            ? Colors.green
                                            : Colors.grey;
                                      });
                                      modelReference.dbInsertVideo(
                                          true, document['name'], url);
                                    }
                                    if (_iconColor == Colors.green) {
                                      FirebaseFirestore.instance
                                          .collection(collection)
                                          .doc(document['name'])
                                          .update({'isFavorite': false});
                                      setState(() {
                                        //color:
                                        _iconColor = document['isFavorite']
                                            ? Colors.green
                                            : Colors.grey;
                                      });
                                      modelReference.dbRemoveVideo(
                                          collection, document['name']);
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            );
          }),
    );
  }

  // void _enableFullscreen(bool fullscreen) {
  //   isFullScreen = fullscreen;
  //   if (fullscreen) {
  //     // Force landscape orientation for fullscreen
  //     SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.landscapeLeft,
  //       DeviceOrientation.landscapeRight,
  //     ]);
  //     SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  //   } else {
  //     // Force portrait
  //     SystemChrome.setPreferredOrientations([
  //       DeviceOrientation.portraitUp,
  //       DeviceOrientation.portraitDown,
  //     ]);
  //     SystemChrome.setEnabledSystemUIOverlays(
  //         [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //     // Set preferred orientation to device default
  //     // Empty list causes the application to defer to the operating system default.
  //     // See: https://api.flutter.dev/flutter/services/SystemChrome/setPreferredOrientations.html
  //     SystemChrome.setPreferredOrientations([]);
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // @override
  // dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   AutoOrientation.portraitAutoMode();
  //   super.dispose();
  // }

}
