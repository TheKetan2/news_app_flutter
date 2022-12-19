import 'package:flutter/material.dart';
import 'package:news_app_flutter/utils.dart';

class NewsHeadlineWidget extends StatelessWidget {
  const NewsHeadlineWidget({Key? key}) : super(key: key);

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
            Image(
              image: NetworkImage(
                "https://pbs.twimg.com/profile_images/1590968738358079488/IY9Gx6Ok_400x400.jpg",
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
                      "kajbdsbasjkavsckja",
                      style: textStyle(
                        16,
                        Colors.black,
                        FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          "Jonh Doe",
                          style: textStyle(
                            14,
                            Colors.grey,
                            FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "12-12-2022",
                          style: textStyle(
                            14,
                            Colors.grey,
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        "Learning a little each day adds up. Research shows that students who make learning a habit are more likely to reach their goals. Set time aside to learn and get reminders using your learning scheduler.",
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
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.play_arrow,
                            size: 43,
                            color: Colors.yellow,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.stop,
                            size: 43,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
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
