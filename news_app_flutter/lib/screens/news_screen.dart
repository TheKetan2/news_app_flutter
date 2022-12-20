import 'package:flutter/material.dart';
import 'package:news_app_flutter/block/get_news_block.dart';
import 'package:news_app_flutter/modals/news_modals.dart';
import 'package:news_app_flutter/utils.dart';

import '../widgets/news_headline_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late GetNewsBloc getNewsBloc;

  @override
  void initState() {
    super.initState();
    getNewsBloc = GetNewsBloc();
    getNewsBloc.getNews("general", "us");
  }

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
            StreamBuilder<NewsResponse>(
                stream: getNewsBloc.subject.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<NewsModal>? newsList = snapshot.data?.news;
                  return ListView.builder(
                    itemCount: newsList?.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      NewsModal news = newsList![index];
                      return NewsHeadlineWidget(
                        author: news.author == null ? "" : news.author,
                        date: news.date == null ? "" : news.date,
                        desc: news.desc == null ? "" : news.desc,
                        img: news.img == null ? "" : news.img,
                        title: news.title == null ? "" : news.title,
                        url: news.url == null ? "" : news.url,
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
