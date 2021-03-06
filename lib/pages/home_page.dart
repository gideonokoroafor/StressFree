import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapp/pages/audio_page.dart';
import 'package:firstapp/pages/history_page.dart';
import 'package:firstapp/pages/mood_page.dart';
import 'package:firstapp/pages/videos_page.dart';
import 'package:firstapp/utils/video_images.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'activities_page.dart';
import 'journal_main_page.dart';
import 'videos_page.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int tipID() {
    Random random = new Random();
    return random.nextInt(9) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stress Free!"),
        ),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.lightBlueAccent, Colors.white])),
              child: Column(children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "Stress Free",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'BackStay'),
                            textScaleFactor: 4,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 2, bottom: 8),
                          child: CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(VideoImage.backgroundImage),
                              foregroundColor: Colors.lightBlueAccent,
                          ),
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.directions_run_rounded,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigoAccent,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              20.0)),
                                      minimumSize: Size(175, 50),
                                      maximumSize: Size(175, 50)),
                                  label: Text('Edit Activities',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ComicSans',
                                          fontSize: 16)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return ActivitiesPage();
                                            }));
                                    setState(() {});
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.sentiment_satisfied_rounded,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigoAccent,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              20.0)),
                                      minimumSize: Size(175, 50),
                                      maximumSize: Size(175, 50)),
                                  label: Text('Mood',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ComicSans',
                                          fontSize: 20)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return MoodPage();
                                            }));
                                    setState(() {});
                                  },
                                ),
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigoAccent,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              20.0)),
                                      minimumSize: Size(175, 50),
                                      maximumSize: Size(175, 50)),
                                  label: Text('Activity History',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ComicSans',
                                          fontSize: 14)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return HistoryPage();
                                            }));
                                    setState(() {});
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigoAccent,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              20.0)),
                                      minimumSize: Size(175, 50),
                                      maximumSize: Size(175, 50)),
                                  label: Text('Videos',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ComicSans',
                                          fontSize: 20)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return VideosPage();
                                            }));
                                    setState(() {});
                                  },
                                ),
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.library_music_rounded,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigoAccent,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              20.0)),
                                      minimumSize: Size(175, 50),
                                      maximumSize: Size(175, 50)),
                                  label: Text('Music/sounds',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ComicSans',
                                          fontSize: 18)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return AudioPage();
                                            }));
                                    setState(() {});
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.book_rounded,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.indigoAccent,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              20.0)),
                                      minimumSize: Size(175, 50),
                                      maximumSize: Size(175, 50)),
                                  label: Text('Journal',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ComicSans',
                                          fontSize: 20)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return MainJournal();
                                            }));
                                    setState(() {});
                                  },
                                ),
                              ),
                            ]),
                      ],
                    )
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('tips')
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 20.0,
                                  left: 20.0,
                                  right: 20.0),
                              child: Text('Loading Tip',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'ComicSans',
                                      color: Colors.blueGrey),
                                  textScaleFactor: 1.5));
                        } else {
                          return Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 20.0,
                                      right: 20.0),
                                  child: Text(
                                      'Tip: ' +
                                          snapshot.data?.docs[tipID()]
                                          ['tip'],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'ComicSans',
                                          color: Colors.blueGrey),
                                      textScaleFactor: 1.5))
                          );
                        }
                      }),
                ),
              ])),
        ));
  }
}
