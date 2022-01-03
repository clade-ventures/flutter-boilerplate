import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/core/extensions/response_extension.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/datasources/github_search_remote_data_source.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/github_user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'datasources/mock_example_github_search_remote_data_source.dart';

void main() {
  GithubSearchRemoteDataSourceImpl dataSource =
      ExampleGithubSearchRemoteDataSourceMock();

  setUpAll(() {
    // dataSource = ();
  });

  void setUpMockGithubSearchUserSuccess200() {
    final resultUser = [GithubUserModel()];
    when<Future<Parsed<List<GithubUserModel>>>>(
      dataSource.searchUser(QuerySearch()),
    ).thenAnswer(
      (_) async => Parsed.fromJson(
        <String, dynamic>{},
        200,
        resultUser,
      ),
    );
  }

  test('Counter increments smoke test', () async {
    // arrange
    setUpMockGithubSearchUserSuccess200();
    // act
    await dataSource.searchUser(QuerySearch());
    // assert
    verify(dataSource.searchUser(QuerySearch()));
  });
}
