import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/datasources/github_search_remote_data_source.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/repositories/github_search_repository_impl.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/domain/repositories/github_search_repository.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_event.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_state.dart';
import 'package:logger/logger.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc() : super(GithubSearchInitial()) {
    final _remoteDataSource = GithubSearchRemoteDataSourceImpl();
    _repo = SearchRepositoryImpl(_remoteDataSource);
    on<SearchGithubData>(_searchData);
    on<SearchGithubDataByPage>(_searchDataByPage);
    on<SearchMoreGithubData>(_searchMoreData);
  }

  SearchRepository? _repo;
  bool isFetching = false;
  bool hasReachedMax = false;

  Future<void> _searchData(
    SearchGithubData event,
    Emitter<GithubSearchState> emit,
  ) async {
    emit(GithubSearchLoading());
    final query = event.querySearch..page = 1;
    if (event.type == 0) {
      await _searchUser(query, emit);
    } else if (event.type == 1) {
      await _searchRepo(query, emit);
    } else if (event.type == 2) {
      await _searchIssue(query, emit);
    }
  }

  Future<void> _searchUser(
    QuerySearch query,
    Emitter<GithubSearchState> emit,
  ) async {
    emit(GithubSearchLoading());
    final resp = await _repo?.searchUser(query);
    resp?.fold((failure) {
      Logger().e(failure.message);
      emit(GithubSearchError(failure: failure));
    }, (result) {
      final reachedMax = result.data.length < query.perPage;
      emit(
        GithubSearchSuccess(
          users: result.data,
          query: query,
          totalCount: result.totalCount,
          type: 0,
          length: result.data.length,
          hasReachedMax: reachedMax,
        ),
      );
    });
  }

  Future<void> _searchRepo(
    QuerySearch query,
    Emitter<GithubSearchState> emit,
  ) async {
    emit(GithubSearchLoading());
    final resp = await _repo?.searchRepo(query);
    resp?.fold((failure) {
      Logger().e(failure.message);
      emit(GithubSearchError(failure: failure));
    }, (result) {
      final reachedMax = result.data.length < query.perPage;
      emit(
        GithubSearchSuccess(
          repositories: result.data,
          query: query,
          totalCount: result.totalCount,
          type: 1,
          length: result.data.length,
          hasReachedMax: reachedMax,
        ),
      );
    });
  }

  Future<void> _searchIssue(
    QuerySearch query,
    Emitter<GithubSearchState> emit,
  ) async {
    emit(GithubSearchLoading());
    final resp = await _repo?.searchIssue(query);
    resp?.fold((failure) {
      Logger().e(failure.message);
      emit(GithubSearchError(failure: failure));
    }, (result) {
      final reachedMax = result.data.length < query.perPage;
      emit(
        GithubSearchSuccess(
          issues: result.data,
          query: query,
          totalCount: result.totalCount,
          type: 1,
          length: result.data.length,
          hasReachedMax: reachedMax,
        ),
      );
    });
  }

  Future<void> _searchDataByPage(
    SearchGithubDataByPage event,
    Emitter<GithubSearchState> emit,
  ) async {
    emit(GithubSearchLoading());
    final query = event.querySearch;
    if (event.type == 0) {
      await _searchUser(query, emit);
    } else if (event.type == 1) {
      await _searchRepo(query, emit);
    } else if (event.type == 2) {
      await _searchIssue(query, emit);
    }
  }

  Future<void> _searchMoreData(
    SearchMoreGithubData event,
    Emitter<GithubSearchState> emit,
  ) async {
    final successState = state as GithubSearchSuccess;
    final query = successState.query;
    ++query.page;
    if (event.type == 0) {
      final resp = await _repo?.searchUser(query);
      resp?.fold((failure) {
        Logger().e(failure.message);
        emit(GithubSearchError(failure: failure));
      }, (result) {
        final reachedMax = result.data.length < query.perPage;
        final users = successState.users;
        users?.addAll(result.data);
        emit(
          successState.copyWith(
            users: users,
            length: users!.length,
            hasReachedMax: reachedMax,
          ),
        );
      });
    } else if (event.type == 1) {
      final resp = await _repo?.searchRepo(query);
      resp?.fold((failure) {
        Logger().e(failure.message);
        emit(GithubSearchError(failure: failure));
      }, (result) {
        final reachedMax = result.data.length < query.perPage;
        final repos = successState.repositories;
        repos?.addAll(result.data);
        emit(
          successState.copyWith(
            repositories: repos,
            length: repos!.length,
            hasReachedMax: reachedMax,
          ),
        );
      });
    } else if (event.type == 2) {
      final resp = await _repo?.searchIssue(query);
      resp?.fold((failure) {
        Logger().e(failure.message);
        emit(GithubSearchError(failure: failure));
      }, (result) {
        final reachedMax = result.data.length < query.perPage;
        final issues = successState.issues;
        issues?.addAll(result.data);
        emit(
          successState.copyWith(
            issues: issues,
            length: issues!.length,
            hasReachedMax: reachedMax,
          ),
        );
      });
    }
    isFetching = false;
  }
}
