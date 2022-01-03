import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/sizer/height_space.dart';
import 'package:flutter_strong_boilerplate/core/theme/font_theme.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/data/models/issue_model.dart';
import 'package:flutter_strong_boilerplate/features/example_github_search/presentation/widgets/user_item.dart';

class IssueItem extends StatelessWidget {
  const IssueItem({
    Key? key,
    required this.issue,
  }) : super(key: key);

  final IssueModel issue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          issue.title.toString(),
          style: FontTheme.rubik14w500black1(),
        ),
        const HeightSize(4),
        Text(
          'Issue Id: ${issue.id}',
          style: FontTheme.rubik12w400black1(),
        ),
        const HeightSize(4),
        Text(
          'score: ${issue.score}',
          style: FontTheme.rubik12w400black1(),
        ),
        if (issue.user != null) ...[
          const HeightSize(10),
          UserItem(user: issue.user!),
        ],
      ],
    );
  }
}
