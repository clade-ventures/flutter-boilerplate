import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/datasources/github_search_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../mocked_dio.dart';

class HttpMock extends Mock implements http.Client {}

class RequestOptionsFake extends Fake implements RequestOptions {}

void main() {
  final dio = Dio();
  late GithubSearchRemoteDataSourceImpl dataSource;
  late QuerySearch q;
  late DioAdapterMock dioAdapterMock;

  setUpAll(() {
    registerFallbackValue(RequestOptionsFake());
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    dataSource = GithubSearchRemoteDataSourceImpl(dio: dio);
    q = QuerySearch(q: 'flutter');
  });

  void setUpMockGithubSearchUserSuccess200() {
    final responsePayload = jsonEncode({
      'total_count': 1,
      'incomplete_results': false,
      'items': [
        {
          'login': 'flutter',
          'id': 14101776,
          'node_id': 'MDEyOk9yZ2FuaXphdGlvbjE0MTAxNzc2',
          'avatar_url': 'https://avatars.githubusercontent.com/u/14101776?v=4',
          'gravatar_id': '',
          'url': 'https://api.github.com/users/flutter',
          'html_url': 'https://github.com/flutter',
          'followers_url': 'https://api.github.com/users/flutter/followers',
          'following_url':
              'https://api.github.com/users/flutter/following{/other_user}',
          'gists_url': 'https://api.github.com/users/flutter/gists{/gist_id}',
          'starred_url':
              'https://api.github.com/users/flutter/starred{/owner}{/repo}',
          'subscriptions_url':
              'https://api.github.com/users/flutter/subscriptions',
          'organizations_url': 'https://api.github.com/users/flutter/orgs',
          'repos_url': 'https://api.github.com/users/flutter/repos',
          'events_url': 'https://api.github.com/users/flutter/events{/privacy}',
          'received_events_url':
              'https://api.github.com/users/flutter/received_events',
          'type': 'Organization',
          'site_admin': false,
          'score': 1.0
        }
      ]
    });
    final httpResponse = ResponseBody.fromString(
      responsePayload,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
    when(
      () => dioAdapterMock.fetch(
        any(),
        any(),
        any(),
      ),
    ).thenAnswer((invocation) async => httpResponse);
  }

  void setUpMockGithubSearchRepoSuccess200() {
    final responsePayload = jsonEncode({
      'total_count': 1,
      'incomplete_results': false,
      'items': [
        {
          'id': 31792824,
          'node_id': 'MDEwOlJlcG9zaXRvcnkzMTc5MjgyNA==',
          'name': 'flutter',
          'full_name': 'flutter/flutter',
          'private': false,
          'owner': {
            'login': 'flutter',
            'id': 14101776,
            'node_id': 'MDEyOk9yZ2FuaXphdGlvbjE0MTAxNzc2',
            'avatar_url':
                'https://avatars.githubusercontent.com/u/14101776?v=4',
            'gravatar_id': '',
            'url': 'https://api.github.com/users/flutter',
            'html_url': 'https://github.com/flutter',
            'followers_url': 'https://api.github.com/users/flutter/followers',
            'following_url':
                'https://api.github.com/users/flutter/following{/other_user}',
            'gists_url': 'https://api.github.com/users/flutter/gists{/gist_id}',
            'starred_url':
                'https://api.github.com/users/flutter/starred{/owner}{/repo}',
            'subscriptions_url':
                'https://api.github.com/users/flutter/subscriptions',
            'organizations_url': 'https://api.github.com/users/flutter/orgs',
            'repos_url': 'https://api.github.com/users/flutter/repos',
            'events_url':
                'https://api.github.com/users/flutter/events{/privacy}',
            'received_events_url':
                'https://api.github.com/users/flutter/received_events',
            'type': 'Organization',
            'site_admin': false
          },
          'html_url': 'https://github.com/flutter/flutter',
          'description': '''
Flutter makes it easy and fast to build beautiful apps for mobile and beyond''',
          'fork': false,
          'url': 'https://api.github.com/repos/flutter/flutter',
          'forks_url': 'https://api.github.com/repos/flutter/flutter/forks',
          'keys_url':
              'https://api.github.com/repos/flutter/flutter/keys{/key_id}',
          'collaborators_url':
              'https://api.github.com/repos/flutter/flutter/collaborators{/collaborator}',
          'teams_url': 'https://api.github.com/repos/flutter/flutter/teams',
          'hooks_url': 'https://api.github.com/repos/flutter/flutter/hooks',
          'issue_events_url':
              'https://api.github.com/repos/flutter/flutter/issues/events{/number}',
          'events_url': 'https://api.github.com/repos/flutter/flutter/events',
          'assignees_url':
              'https://api.github.com/repos/flutter/flutter/assignees{/user}',
          'branches_url':
              'https://api.github.com/repos/flutter/flutter/branches{/branch}',
          'tags_url': 'https://api.github.com/repos/flutter/flutter/tags',
          'blobs_url':
              'https://api.github.com/repos/flutter/flutter/git/blobs{/sha}',
          'git_tags_url':
              'https://api.github.com/repos/flutter/flutter/git/tags{/sha}',
          'git_refs_url':
              'https://api.github.com/repos/flutter/flutter/git/refs{/sha}',
          'trees_url':
              'https://api.github.com/repos/flutter/flutter/git/trees{/sha}',
          'statuses_url':
              'https://api.github.com/repos/flutter/flutter/statuses/{sha}',
          'languages_url':
              'https://api.github.com/repos/flutter/flutter/languages',
          'stargazers_url':
              'https://api.github.com/repos/flutter/flutter/stargazers',
          'contributors_url':
              'https://api.github.com/repos/flutter/flutter/contributors',
          'subscribers_url':
              'https://api.github.com/repos/flutter/flutter/subscribers',
          'subscription_url':
              'https://api.github.com/repos/flutter/flutter/subscription',
          'commits_url':
              'https://api.github.com/repos/flutter/flutter/commits{/sha}',
          'git_commits_url':
              'https://api.github.com/repos/flutter/flutter/git/commits{/sha}',
          'comments_url':
              'https://api.github.com/repos/flutter/flutter/comments{/number}',
          'issue_comment_url':
              'https://api.github.com/repos/flutter/flutter/issues/comments{/number}',
          'contents_url':
              'https://api.github.com/repos/flutter/flutter/contents/{+path}',
          'compare_url':
              'https://api.github.com/repos/flutter/flutter/compare/{base}...{head}',
          'merges_url': 'https://api.github.com/repos/flutter/flutter/merges',
          'archive_url':
              'https://api.github.com/repos/flutter/flutter/{archive_format}{/ref}',
          'downloads_url':
              'https://api.github.com/repos/flutter/flutter/downloads',
          'issues_url':
              'https://api.github.com/repos/flutter/flutter/issues{/number}',
          'pulls_url':
              'https://api.github.com/repos/flutter/flutter/pulls{/number}',
          'milestones_url':
              'https://api.github.com/repos/flutter/flutter/milestones{/number}',
          'notifications_url':
              'https://api.github.com/repos/flutter/flutter/notifications{?since,all,participating}',
          'labels_url':
              'https://api.github.com/repos/flutter/flutter/labels{/name}',
          'releases_url':
              'https://api.github.com/repos/flutter/flutter/releases{/id}',
          'deployments_url':
              'https://api.github.com/repos/flutter/flutter/deployments',
          'created_at': '2015-03-06T22:54:58Z',
          'updated_at': '2022-01-04T01:33:20Z',
          'pushed_at': '2022-01-03T23:40:51Z',
          'git_url': 'git://github.com/flutter/flutter.git',
          'ssh_url': 'git@github.com:flutter/flutter.git',
          'clone_url': 'https://github.com/flutter/flutter.git',
          'svn_url': 'https://github.com/flutter/flutter',
          'homepage': 'https://flutter.dev',
          'size': 178179,
          'stargazers_count': 133870,
          'watchers_count': 133870,
          'language': 'Dart',
          'has_issues': true,
          'has_projects': true,
          'has_downloads': true,
          'has_wiki': true,
          'has_pages': false,
          'forks_count': 20051,
          'mirror_url': null,
          'archived': false,
          'disabled': false,
          'open_issues_count': 10160,
          'license': {
            'key': 'bsd-3-clause',
            'name': 'BSD 3-Clause "New" or "Revised" License',
            'spdx_id': 'BSD-3-Clause',
            'url': 'https://api.github.com/licenses/bsd-3-clause',
            'node_id': 'MDc6TGljZW5zZTU='
          },
          'allow_forking': true,
          'is_template': false,
          'topics': [
            'android',
            'app-framework',
            'dart',
            'dart-platform',
            'desktop',
            'fuchsia',
            'ios',
            'linux-desktop',
            'macos',
            'material-design',
            'mobile',
            'skia',
            'web',
            'web-framework',
            'windows'
          ],
          'visibility': 'public',
          'forks': 20051,
          'open_issues': 10160,
          'watchers': 133870,
          'default_branch': 'master',
          'score': 1.0
        }
      ]
    });
    final httpResponse = ResponseBody.fromString(
      responsePayload,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
    when(
      () => dioAdapterMock.fetch(
        any(),
        any(),
        any(),
      ),
    ).thenAnswer((invocation) async => httpResponse);
  }

  void setUpMockGithubSearchIssueSuccess200() {
    final responsePayload = jsonEncode({
      'total_count': 1,
      'incomplete_results': false,
      'items': [
        {
          'url':
              'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/issues/5',
          'repository_url':
              'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone',
          'labels_url':
              'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/issues/5/labels{/name}',
          'comments_url':
              'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/issues/5/comments',
          'events_url':
              'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/issues/5/events',
          'html_url':
              'https://github.com/SyafiqHadzir/Personal-Milestone/issues/5',
          'id': 1040767853,
          'node_id': 'I_kwDOGTuJNM4-CNtt',
          'number': 5,
          'title': 'Flutter Tutorial',
          'user': {
            'login': 'SyafiqHadzir',
            'id': 34176032,
            'node_id': 'MDQ6VXNlcjM0MTc2MDMy',
            'avatar_url':
                'https://avatars.githubusercontent.com/u/34176032?v=4',
            'gravatar_id': '',
            'url': 'https://api.github.com/users/SyafiqHadzir',
            'html_url': 'https://github.com/SyafiqHadzir',
            'followers_url':
                'https://api.github.com/users/SyafiqHadzir/followers',
            'following_url':
                'https://api.github.com/users/SyafiqHadzir/following{/other_user}',
            'gists_url':
                'https://api.github.com/users/SyafiqHadzir/gists{/gist_id}',
            'starred_url':
                'https://api.github.com/users/SyafiqHadzir/starred{/owner}{/repo}',
            'subscriptions_url':
                'https://api.github.com/users/SyafiqHadzir/subscriptions',
            'organizations_url':
                'https://api.github.com/users/SyafiqHadzir/orgs',
            'repos_url': 'https://api.github.com/users/SyafiqHadzir/repos',
            'events_url':
                'https://api.github.com/users/SyafiqHadzir/events{/privacy}',
            'received_events_url':
                'https://api.github.com/users/SyafiqHadzir/received_events',
            'type': 'User',
            'site_admin': false
          },
          'labels': [
            {
              'id': 3506477673,
              'node_id': 'LA_kwDOGTuJNM7RAJpp',
              'url':
                  'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/labels/learning',
              'name': 'learning',
              'color': '0075ca',
              'default': false,
              'description': 'Competency and skill improvements.'
            },
            {
              'id': 3506477675,
              'node_id': 'LA_kwDOGTuJNM7RAJpr',
              'url':
                  'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/labels/front-end',
              'name': 'front-end',
              'color': 'a2eeef',
              'default': false,
              'description': 'e.g., UI/UX.'
            },
            {
              'id': 3506477676,
              'node_id': 'LA_kwDOGTuJNM7RAJps',
              'url':
                  'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/labels/focused',
              'name': 'focused',
              'color': '008672',
              'default': false,
              'description': 'Extra attention is needed.'
            },
            {
              'id': 3506477679,
              'node_id': 'LA_kwDOGTuJNM7RAJpv',
              'url':
                  'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/labels/framework',
              'name': 'framework',
              'color': 'd876e3',
              'default': false,
              'description': '''
A basic structure underlying a system, concept, or text.'''
            },
            {
              'id': 3506477680,
              'node_id': 'LA_kwDOGTuJNM7RAJpw',
              'url':
                  'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/labels/paused',
              'name': 'paused',
              'color': 'ffffff',
              'default': false,
              'description': 'This will not be worked on.'
            },
            {
              'id': 3506553420,
              'node_id': 'LA_kwDOGTuJNM7RAcJM',
              'url':
                  'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/labels/dart',
              'name': 'dart',
              'color': '32D55D',
              'default': false,
              'description': '''
A programming language designed for client development, such as for the web and mobile apps.'''
            }
          ],
          'state': 'open',
          'locked': false,
          'assignee': {
            'login': 'SyafiqHadzir',
            'id': 34176032,
            'node_id': 'MDQ6VXNlcjM0MTc2MDMy',
            'avatar_url':
                'https://avatars.githubusercontent.com/u/34176032?v=4',
            'gravatar_id': '',
            'url': 'https://api.github.com/users/SyafiqHadzir',
            'html_url': 'https://github.com/SyafiqHadzir',
            'followers_url':
                'https://api.github.com/users/SyafiqHadzir/followers',
            'following_url':
                'https://api.github.com/users/SyafiqHadzir/following{/other_user}',
            'gists_url':
                'https://api.github.com/users/SyafiqHadzir/gists{/gist_id}',
            'starred_url':
                'https://api.github.com/users/SyafiqHadzir/starred{/owner}{/repo}',
            'subscriptions_url':
                'https://api.github.com/users/SyafiqHadzir/subscriptions',
            'organizations_url':
                'https://api.github.com/users/SyafiqHadzir/orgs',
            'repos_url': 'https://api.github.com/users/SyafiqHadzir/repos',
            'events_url':
                'https://api.github.com/users/SyafiqHadzir/events{/privacy}',
            'received_events_url':
                'https://api.github.com/users/SyafiqHadzir/received_events',
            'type': 'User',
            'site_admin': false
          },
          'assignees': [
            {
              'login': 'SyafiqHadzir',
              'id': 34176032,
              'node_id': 'MDQ6VXNlcjM0MTc2MDMy',
              'avatar_url':
                  'https://avatars.githubusercontent.com/u/34176032?v=4',
              'gravatar_id': '',
              'url': 'https://api.github.com/users/SyafiqHadzir',
              'html_url': 'https://github.com/SyafiqHadzir',
              'followers_url':
                  'https://api.github.com/users/SyafiqHadzir/followers',
              'following_url':
                  'https://api.github.com/users/SyafiqHadzir/following{/other_user}',
              'gists_url':
                  'https://api.github.com/users/SyafiqHadzir/gists{/gist_id}',
              'starred_url':
                  'https://api.github.com/users/SyafiqHadzir/starred{/owner}{/repo}',
              'subscriptions_url':
                  'https://api.github.com/users/SyafiqHadzir/subscriptions',
              'organizations_url':
                  'https://api.github.com/users/SyafiqHadzir/orgs',
              'repos_url': 'https://api.github.com/users/SyafiqHadzir/repos',
              'events_url':
                  'https://api.github.com/users/SyafiqHadzir/events{/privacy}',
              'received_events_url':
                  'https://api.github.com/users/SyafiqHadzir/received_events',
              'type': 'User',
              'site_admin': false
            }
          ],
          'milestone': {
            'url':
                'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/milestones/3',
            'html_url':
                'https://github.com/SyafiqHadzir/Personal-Milestone/milestone/3',
            'labels_url':
                'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/milestones/3/labels',
            'id': 7310742,
            'node_id': 'MI_kwDOGTuJNM4Ab42W',
            'number': 3,
            'title': 'Weekly (18 - 22 Oct)',
            'description': '',
            'creator': {
              'login': 'SyafiqHadzir',
              'id': 34176032,
              'node_id': 'MDQ6VXNlcjM0MTc2MDMy',
              'avatar_url':
                  'https://avatars.githubusercontent.com/u/34176032?v=4',
              'gravatar_id': '',
              'url': 'https://api.github.com/users/SyafiqHadzir',
              'html_url': 'https://github.com/SyafiqHadzir',
              'followers_url':
                  'https://api.github.com/users/SyafiqHadzir/followers',
              'following_url':
                  'https://api.github.com/users/SyafiqHadzir/following{/other_user}',
              'gists_url':
                  'https://api.github.com/users/SyafiqHadzir/gists{/gist_id}',
              'starred_url':
                  'https://api.github.com/users/SyafiqHadzir/starred{/owner}{/repo}',
              'subscriptions_url':
                  'https://api.github.com/users/SyafiqHadzir/subscriptions',
              'organizations_url':
                  'https://api.github.com/users/SyafiqHadzir/orgs',
              'repos_url': 'https://api.github.com/users/SyafiqHadzir/repos',
              'events_url':
                  'https://api.github.com/users/SyafiqHadzir/events{/privacy}',
              'received_events_url':
                  'https://api.github.com/users/SyafiqHadzir/received_events',
              'type': 'User',
              'site_admin': false
            },
            'open_issues': 2,
            'closed_issues': 2,
            'state': 'open',
            'created_at': '2021-11-01T04:50:41Z',
            'updated_at': '2021-11-23T07:09:08Z',
            'due_on': '2021-10-22T07:00:00Z',
            'closed_at': null
          },
          'comments': 0,
          'created_at': '2021-11-01T05:00:43Z',
          'updated_at': '2021-11-01T05:03:48Z',
          'closed_at': null,
          'author_association': 'OWNER',
          'active_lock_reason': null,
          'body':
              'Flutter Course - Full Tutorial for Beginners (Build iOS and Android Apps)\r\n\r\nLink: https://www.youtube.com/watch?v=pTJJsmejUOQ\r\n\r\nRepository: https://gitlab.com/SyafiqHadzir/kotlin-tutorial/-/tree/main/tutorials/flutter-tutorial-beginners\r\n\r\n### Milestones\r\n\r\n- [x] Introduction\r\n- [ ] Layout in Flutter\r\n- [ ] Images\r\n- [ ] Text\r\n- [ ] Models\r\n- [ ] Navigation and Lists',
          'reactions': {
            'url':
                'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/issues/5/reactions',
            'total_count': 0,
            '+1': 0,
            '-1': 0,
            'laugh': 0,
            'hooray': 0,
            'confused': 0,
            'heart': 0,
            'rocket': 0,
            'eyes': 0
          },
          'timeline_url':
              'https://api.github.com/repos/SyafiqHadzir/Personal-Milestone/issues/5/timeline',
          'performed_via_github_app': null,
          'score': 1.0
        }
      ]
    });
    final httpResponse = ResponseBody.fromString(
      responsePayload,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
    when(
      () => dioAdapterMock.fetch(
        any(),
        any(),
        any(),
      ),
    ).thenAnswer((invocation) async => httpResponse);
  }

  group('Github Search Remote Data Source Test', () {
    test('Github search user unit test', () async {
      // arrange
      setUpMockGithubSearchUserSuccess200();
      // act
      final resp = await dataSource.searchUser(q);
      // assert
      expect(resp.statusCode, 200);
      expect(resp.data.first.toJson(), isA<Map<String, dynamic>>());
    });

    test('Github search repo unit test', () async {
      // arrange
      setUpMockGithubSearchRepoSuccess200();
      // act
      final resp = await dataSource.searchRepo(q);
      // assert
      expect(resp.statusCode, 200);
      expect(resp.data.first.toJson(), isA<Map<String, dynamic>>());
    });

    test('Github search issue unit test', () async {
      // arrange
      setUpMockGithubSearchIssueSuccess200();
      // act
      final resp = await dataSource.searchIssue(q);
      // assert
      expect(resp.statusCode, 200);
      expect(resp.data.first.toJson(), isA<Map<String, dynamic>>());
    });
  });
}
