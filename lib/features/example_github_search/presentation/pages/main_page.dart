import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_strong_boilerplate/core/bases/entities/query_search.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/organisms/loading_type_bar.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/organisms/search_bar.dart';
import 'package:flutter_strong_boilerplate/core/theme/font_theme.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_bloc.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_event.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/bloc/github_search_state.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/pages/github_search_list_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final searchController = TextEditingController();
  final types = <String>['Users', 'Repositories', 'Issues'];
  int selectedIndex = 0;
  int pageIndex = 0;

  String? _lastStringQ;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: kToolbarHeight + 10,
              title: SearchBar(
                hintText: 'Search',
                padding: const EdgeInsets.only(bottom: 8),
                onChanged: _onSearch,
                controller: searchController,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverHeaderDelegate(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  color: Colors.white,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: types
                            .map(
                              (e) => Expanded(
                                child: Row(
                                  children: [
                                    Radio<int>(
                                      visualDensity: VisualDensity.compact,
                                      value: types.indexOf(e),
                                      groupValue: pageIndex,
                                      onChanged: (val) {
                                        setState(() {
                                          pageIndex = val!;
                                        });
                                        final state = context
                                            .read<GithubSearchBloc>()
                                            .state;
                                        if (state is! GithubSearchInitial) {
                                          final q = QuerySearch(
                                            q: searchController.text,
                                          );
                                          context.read<GithubSearchBloc>().add(
                                                SearchGithubData(
                                                  querySearch: q,
                                                  type: pageIndex,
                                                ),
                                              );
                                        }
                                      },
                                    ),
                                    Text(
                                      e,
                                      style: FontTheme.rubik12w500black1(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      LoadingTypeBar(
                        selectedIndex: selectedIndex,
                        onChanged: (val) {
                          setState(() {
                            selectedIndex = val;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
          // controller: _scrollController,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GithubSearchListView(
              loadingType: selectedIndex,
              type: pageIndex,
              stringQuery: searchController.text,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSearch(String val) async {
    if (_lastStringQ == val) {
      return;
    }
    _lastStringQ = val;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    context.read<GithubSearchBloc>().hasReachedMax = false;
    _debounce = Timer(const Duration(milliseconds: 1600), () {
      final initialQ = QuerySearch(q: val);
      context.read<GithubSearchBloc>().add(
            SearchGithubData(
              querySearch: initialQ,
              type: pageIndex,
            ),
          );
    });
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Container child;

  _SliverHeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
