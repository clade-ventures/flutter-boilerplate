import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/atoms/circle_loading.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/atoms/height_size.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/atoms/width_size.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/layout/base_pagination_state.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/molecules/custom_scaffold.dart';
import 'package:flutter_strong_boilerplate/core/screen/sizing_information.dart';
import 'package:flutter_strong_boilerplate/core/theme/base_colors.dart';
import 'package:flutter_strong_boilerplate/core/theme/font_theme.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_bloc.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_event.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_state.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/widgets/issue_item.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/widgets/repository_item.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/widgets/user_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GithubSearchListView extends StatefulWidget {
  const GithubSearchListView({
    Key? key,
    required this.loadingType,
    required this.type,
    this.stringQuery,
  }) : super(key: key);

  final int loadingType;
  final int type;
  final String? stringQuery;

  @override
  _GithubSearchListViewState createState() => _GithubSearchListViewState();
}

class _GithubSearchListViewState
    extends BasePaginationState<GithubSearchListView> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  @override
  ScaffoldAttribute buildAttribute() {
    return ScaffoldAttribute();
  }

  @override
  Widget buildNarrowLayout(BuildContext context, SizingInformation sizeInfo) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      builder: (context, state) {
        if (state is GithubSearchInitial) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/fi_search.svg',
                height: 40,
                width: 40,
              ),
              const HeightSize(10),
              Center(
                child: Text(
                  'Start Searching Users by\nenter some text',
                  style: FontTheme.rubik16w500black1(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }
        if (state is GithubSearchLoading) {
          return const CircleLoading();
        }
        if (state is GithubSearchError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/fi_search.svg',
                height: 40,
                width: 40,
              ),
              const HeightSize(10),
              Center(
                child: Text(
                  state.failure.message ?? 'Something error',
                  style: FontTheme.rubik16w500black1(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }
        if (state is GithubSearchSuccess) {
          final length = state.length;
          if (length == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/fi_search.svg',
                  height: 40,
                  width: 40,
                ),
                const HeightSize(10),
                Center(
                  child: Text(
                    '''
Cannot found ${widget.stringQuery}\nin ${_mapByType(widget.type)}''',
                    style: FontTheme.rubik16w500black1(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          }
          // if (widget.loadingType == 0) {
          return ListView.separated(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            itemBuilder: (c, i) {
              if (widget.loadingType == 1 && i == length) {
                final pages = (state.totalCount ~/ state.query.perPage) + 1;
                final currentPage = state.query.page;
                return Column(
                  children: [
                    Text(
                      'Pages ($pages)',
                      style: FontTheme.rubik14w500black1(),
                    ),
                    const HeightSize(10),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: ListView.separated(
                          physics: const ScrollPhysics(),
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: pages,
                          separatorBuilder: (_, __) => const WidthSize(6),
                          itemBuilder: (c, i) {
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  final query = state.query..page = i + 1;
                                  context.read<GithubSearchBloc>().add(
                                        SearchGithubDataByPage(
                                          querySearch: query,
                                          type: widget.type,
                                        ),
                                      );
                                },
                                child: Text(
                                  (i + 1).toString(),
                                  style: FontTheme.rubik14w500black1().copyWith(
                                    color: currentPage == i + 1
                                        ? null
                                        : BaseColors.disableColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
                // return Text('asd');
              }
              if (!state.hasReachedMax && i == length) {
                return const CircleLoading();
              } else if (widget.type == 0) {
                final user = state.users![i];
                return UserItem(user: user);
              } else if (widget.type == 1) {
                final repo = state.repositories![i];
                return RepositoryItem(repo: repo);
              } else {
                final issue = state.issues![i];
                return IssueItem(issue: issue);
              }
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: widget.loadingType == 1
                ? length + 1
                : state.hasReachedMax
                    ? length
                    : length + 1,
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget buildWideLayout(BuildContext context, SizingInformation sizeInfo) {
    return buildNarrowLayout(context, sizeInfo);
  }

  @override
  void init() {}

  @override
  Future<bool> onBackPressed() async {
    return true;
  }

  @override
  void onScroll() {
    context.read<GithubSearchBloc>()
      ..isFetching = true
      ..add(
        SearchMoreGithubData(
          type: widget.type,
        ),
      );
  }

  @override
  bool scrollCondition() {
    return !context.read<GithubSearchBloc>().isFetching &&
        !context.read<GithubSearchBloc>().hasReachedMax &&
        widget.loadingType == 0;
  }

  String? _mapByType(int type) {
    if (widget.type == 0) {
      return 'Users';
    } else if (widget.type == 1) {
      return 'Repositories';
    } else if (widget.type == 2) {
      return 'Issues';
    }
  }
}
