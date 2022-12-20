import 'package:news_app_flutter/modals/news_modals.dart';
import 'package:news_app_flutter/repo/news_repo.dart';
import 'package:rxdart/rxdart.dart';

class GetNewsBloc {
  final BehaviorSubject<NewsResponse> _subject =
      BehaviorSubject<NewsResponse>();
  final NewsRepo newsRepo = NewsRepo();

  BehaviorSubject<NewsResponse> get subject => _subject;

  getNews(String categagy, String country) async {
    NewsResponse newsResponse = await newsRepo.getNews(categagy, country);
    _subject.sink.add(newsResponse);
  }

  dispose() {
    _subject.close();
  }
}
