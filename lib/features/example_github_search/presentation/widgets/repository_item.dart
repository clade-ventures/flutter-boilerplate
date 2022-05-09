import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/bases/widgets/atoms/height_size.dart';
import '../../../../core/bases/widgets/atoms/width_size.dart';
import '../../../../core/bases/widgets/molecules/messenger.dart';
import '../../../../core/theme/font_theme.dart';
import '../../data/models/repository_model.dart';

class RepositoryItem extends StatelessWidget {
  const RepositoryItem({
    Key? key,
    required this.repo,
  }) : super(key: key);

  final RepositoryModel repo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          repo.name.toString(),
          style: FontTheme.rubik14w500black1(),
        ),
        const HeightSize(4),
        Text(
          'Id: ${repo.id}',
          style: FontTheme.rubik12w400black1(),
        ),
        const HeightSize(4),
        Row(
          children: [
            Expanded(
              child: Text(
                'url: ${repo.url}',
                style: FontTheme.rubik12w400black1(),
              ),
            ),
            const WidthSize(10),
            InkWell(
              onTap: () {
                Clipboard.setData(
                  ClipboardData(text: repo.url),
                );
                // TODO(Any): Specify Messenger Here.
                Messenger.successX('Repository Url copied');
              },
              child: const Icon(
                Icons.copy,
                size: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
