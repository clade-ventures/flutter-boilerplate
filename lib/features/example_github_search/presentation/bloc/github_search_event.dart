import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';

abstract class GithubSearchEvent {}

class SearchGithubData extends GithubSearchEvent {
  QuerySearch querySearch;
  int type;
  SearchGithubData({
    required this.querySearch,
    required this.type,
  });
}

class SearchGithubDataByPage extends GithubSearchEvent {
  QuerySearch querySearch;
  int type;

  SearchGithubDataByPage({
    required this.querySearch,
    required this.type,
  });
}

class SearchMoreGithubData extends GithubSearchEvent {
  int type;

  SearchMoreGithubData({
    required this.type,
  });
}
