import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/core/errors/decider.dart';
import 'package:flutter_strong_boilerplate/core/errors/failures.dart';
import 'package:flutter_strong_boilerplate/core/extensions/response_extension.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/github_user_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/issue_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/repository_model.dart';

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
