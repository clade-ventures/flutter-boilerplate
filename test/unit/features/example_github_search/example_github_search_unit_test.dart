import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/core/extensions/response_extension.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/github_user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'datasources/mock_example_github_search_remote_data_source.dart';

class HttpMock extends Mock implements http.Client {}

void main() {
  late ExampleGithubSearchRemoteDataSourceMock dataSource;
  late QuerySearch q;

  setUpAll(() {
    dataSource = ExampleGithubSearchRemoteDataSourceMock();
    q = QuerySearch();
  });

  void setUpMockGithubSearchUserSuccess200() {
    final resultUser = [GithubUserModel()];
    when<Future<Parsed<List<GithubUserModel>>>>(
      () => dataSource.searchUser(q),
    ).thenAnswer(
      (_) async => Parsed.fromJson(
        <String, dynamic>{},
        200,
        resultUser,
      ),
    );
  }

  test('Github search user test', () async {
    // arrange
    setUpMockGithubSearchUserSuccess200();
    // act
    await dataSource.searchUser(q);
    // assert
    verify(() => dataSource.searchUser(q));
  });
}
