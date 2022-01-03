import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/core/client/api_call.dart';
import 'package:flutter_strong_boilerplate/core/errors/decider.dart';
import 'package:flutter_strong_boilerplate/core/errors/failures.dart';
import 'package:flutter_strong_boilerplate/core/extensions/response_extension.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/datasources/github_search_remote_data_source.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/github_user_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/issue_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/repository_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/domain/repositories/github_search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final GithubSearchRemoteDataSource _remoteDataSource;

  SearchRepositoryImpl(this._remoteDataSource);

  @override
  Future<Decide<Failure, Parsed<List<GithubUserModel>>>> searchUser(
    QuerySearch q,
  ) async {
    return apiCall(_remoteDataSource.searchUser(q));
  }

  @override
  Future<Decide<Failure, Parsed<List<IssueModel>>>> searchIssue(
    QuerySearch q,
  ) async {
    return apiCall(_remoteDataSource.searchIssue(q));
  }

  @override
  Future<Decide<Failure, Parsed<List<RepositoryModel>>>> searchRepo(
    QuerySearch q,
  ) async {
    return apiCall(_remoteDataSource.searchRepo(q));
  }
}
