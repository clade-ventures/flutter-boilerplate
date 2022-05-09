import '../../../../core/bases/entities/query_search.dart';
import '../../../../core/errors/decider.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/response_extension.dart';
import '../../data/models/github_user_model.dart';
import '../../data/models/issue_model.dart';
import '../../data/models/repository_model.dart';

abstract class SearchRepository {
  Future<Decide<Failure, Parsed<List<GithubUserModel>>>> searchUser(
    QuerySearch q,
  );

  Future<Decide<Failure, Parsed<List<RepositoryModel>>>> searchRepo(
    QuerySearch q,
  );

  Future<Decide<Failure, Parsed<List<IssueModel>>>> searchIssue(
    QuerySearch q,
  );
}
