import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
