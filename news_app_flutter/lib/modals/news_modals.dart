import 'dart:convert';

class NewsModal {
  final String author;
  final String title;
  final String desc;
  final String img;
  final String date;
  final String url;

  NewsModal(
    this.author,
    this.title,
    this.desc,
    this.img,
    this.date,
    this.url,
  );

  factory NewsModal.fromJson(Map<String, dynamic> json) {
    return NewsModal(
      json['author'],
      json['title'],
      json['description'],
      json['urlToImage'],
      json['publishAt'],
      json['url'],
    );
  }
}

class NewsResponse {
  final List<NewsModal> news;
  final String error;

  NewsResponse(this.news, this.error);

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      (json['articles'] as List)
          .map(
            (article) => NewsModal.fromJson(article),
          )
          .toList(),
      "",
    );
  }

  factory NewsResponse.showError(String error) {
    return NewsResponse([], error);
  }
}
