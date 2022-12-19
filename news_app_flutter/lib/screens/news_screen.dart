import 'package:flutter/material.dart';
import 'package:news_app_flutter/utils.dart';

import '../widgets/news_headline_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "FlutterNewsApp",
          style: textStyle(
            25,
            Colors.black,
            FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map(
                      (category) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category,
                          style: textStyle(
                            25,
                            Colors.grey,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NewsHeadlineWidget();
              },
            )
          ],
        ),
      ),
    );
  }
}
