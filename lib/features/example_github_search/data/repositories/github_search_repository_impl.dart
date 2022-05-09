import '../../../../core/bases/entities/query_search.dart';
import '../../../../core/client/api_call.dart';
import '../../../../core/errors/decider.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/response_extension.dart';
import '../../domain/repositories/github_search_repository.dart';
import '../datasources/github_search_remote_data_source.dart';
import '../models/github_user_model.dart';
import '../models/issue_model.dart';
import '../models/repository_model.dart';

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
