import 'package:equatable/equatable.dart';
import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/core/errors/failures.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/github_user_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/issue_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/repository_model.dart';

abstract class GithubSearchState extends Equatable {
  const GithubSearchState();
}

class GithubSearchInitial extends GithubSearchState {
  @override
  List<Object> get props => <Object>[];

  @override
  String toString() {
    return 'GithubUsersInitial';
  }
}

class GithubSearchLoading extends GithubSearchState {
  @override
  List<Object> get props => <Object>[];

  @override
  String toString() {
    return 'GithubUsersLoading';
  }
}

class GithubSearchError extends GithubSearchState {
  final Failure failure;

  const GithubSearchError({required this.failure});

  @override
  List<Object> get props => <Object>[];

  @override
  String toString() {
    return 'GithubUsersError';
  }
}

class GithubSearchSuccess extends GithubSearchState {
  const GithubSearchSuccess({
    this.users,
    this.repositories,
    this.issues,
    required this.query,
    required this.totalCount,
    required this.type,
    required this.length,
    required this.hasReachedMax,
  });

  final List<GithubUserModel>? users;
  final List<RepositoryModel>? repositories;
  final List<IssueModel>? issues;
  final QuerySearch query;
  final int totalCount;
  final int type;
  final int length;
  final bool hasReachedMax;

  @override
  List<Object> get props => <Object>[
        if (users != null) ...users!,
        if (repositories != null) ...repositories!,
        if (issues != null) ...issues!,
        query,
        totalCount,
        type,
        length,
        hasReachedMax,
      ];

  @override
  String toString() {
    return 'GithubUsersSuccess';
  }

  GithubSearchSuccess copyWith({
    List<GithubUserModel>? users,
    List<RepositoryModel>? repositories,
    List<IssueModel>? issues,
    QuerySearch? query,
    int? totalCount,
    int? type,
    int? length,
    bool? hasReachedMax,
  }) {
    return GithubSearchSuccess(
      users: users ?? this.users,
      query: query ?? this.query,
      totalCount: totalCount ?? this.totalCount,
      repositories: repositories ?? this.repositories,
      issues: issues ?? this.issues,
      type: type ?? this.type,
      length: length ?? this.length,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
