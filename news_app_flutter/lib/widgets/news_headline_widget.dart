import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:news_app_flutter/screens/webview_screen.dart';
import 'package:news_app_flutter/utils.dart';

class NewsHeadlineWidget extends StatelessWidget {
  final String author;
  final String title;
  final String desc;
  final String img;
  final String date;
  final String url;

  NewsHeadlineWidget(
      {super.key,
      required this.author,
      required this.title,
      required this.desc,
      required this.img,
      required this.date,
      required this.url});

  FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            img == ""
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: 150,
                  )
                : Image(
                    image: NetworkImage(
                      img,
                    ),
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 5, left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textStyle(
                        16,
                        Colors.black,
                        FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            author.length == 0
                                ? "Author not mentioned..."
                                : author.split(",")[0],
                            style: textStyle(
                              14,
                              Colors.grey,
                              FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          DateFormat("yMd").format(DateTime.parse(date)),
                          style: textStyle(
                            14,
                            Colors.grey,
                            FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        desc,
                        style: textStyle(
                          14,
                          Colors.black,
                          FontWeight.w600,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            speak(desc);
                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 43,
                            color: Colors.yellow,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            flutterTts.stop();
                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.stop,
                            size: 43,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebpageScreen(
                                  title: title,
                                  uri: url,
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.yellow,
                          ),
                          child: Text(
                            "View",
                            style: textStyle(15, Colors.black, FontWeight.w600),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
