import 'package:flutter/material.dart';
import '../../../../core/bases/widgets/atoms/custom_network_image.dart';
import '../../../../core/bases/widgets/atoms/height_size.dart';
import '../../../../core/bases/widgets/atoms/width_size.dart';
import '../../../../core/theme/font_theme.dart';
import '../../data/models/github_user_model.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final GithubUserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 42,
          width: 42,
          child: CustomNetworkImage(
            url: user.avatarUrl.toString(),
          ),
        ),
        const WidthSize(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.login.toString(),
                style: FontTheme.rubik14w500black1(),
              ),
              const HeightSize(4),
              Text(
                'Id: ${user.id}',
                style: FontTheme.rubik12w400black1(),
              ),
              // const HeightSize(4),
              // Text(
              //   'gist: ${user.gistsUrl}',
              //   style: FontTheme.rubik12w400black1(),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
