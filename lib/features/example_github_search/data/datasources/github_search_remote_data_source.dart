import 'package:dio/dio.dart';
import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/core/client/dio.dart';
import 'package:flutter_strong_boilerplate/core/environments/endpoints.dart';
import 'package:flutter_strong_boilerplate/core/extensions/response_extension.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/github_user_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/issue_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/repository_model.dart';

abstract class GithubSearchRemoteDataSource {
  Future<Parsed<List<GithubUserModel>>> searchUser(QuerySearch q);
  Future<Parsed<List<RepositoryModel>>> searchRepo(QuerySearch q);
  Future<Parsed<List<IssueModel>>> searchIssue(QuerySearch q);
}

class GithubSearchRemoteDataSourceImpl implements GithubSearchRemoteDataSource {
  GithubSearchRemoteDataSourceImpl({this.dio});
  final Dio? dio;

  @override
  Future<Parsed<List<GithubUserModel>>> searchUser(QuerySearch q) async {
    final list = <GithubUserModel>[];
    final url = '${Endpoints.searchUsers}?$q';
    final resp = await getIt(url, dio: dio, headers: <String, String>{});
    for (final data in resp.bodyAsMap['items']) {
      list.add(GithubUserModel.fromJson(data));
    }
    return resp.parse(list);
  }

  @override
  Future<Parsed<List<RepositoryModel>>> searchRepo(QuerySearch q) async {
    final list = <RepositoryModel>[];
    final url = '${Endpoints.searchRepositories}?$q';
    final resp = await getIt(url, dio: dio, headers: <String, String>{});
    for (final data in resp.bodyAsMap['items']) {
      list.add(RepositoryModel.fromJson(data));
    }
    return resp.parse(list);
  }

  @override
  Future<Parsed<List<IssueModel>>> searchIssue(QuerySearch q) async {
    final list = <IssueModel>[];
    final url = '${Endpoints.searchIssues}?$q';
    final resp = await getIt(url, dio: dio, headers: <String, String>{});
    for (final data in resp.bodyAsMap['items']) {
      list.add(IssueModel.fromJson(data));
    }
    return resp.parse(list);
  }
}
