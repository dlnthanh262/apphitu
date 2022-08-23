import 'package:flutter/material.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../../themes/colors.dart';

class MGInputText extends StatelessWidget {
  final String title;
  final String hint;

  const MGInputText({Key? key, this.title = "",this.hint = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: title.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .textStyle14
                  .copyWith(color: MGColors.black),
            ),
          ),
        ),
        Expanded(
          child: TextField(
            style: Theme.of(context)
                .textTheme
                .textStyle14
                .copyWith(color: MGColors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .textStyle14
                    .copyWith(color: MGColors.grey)),
          ),
        ),
      ],
    );
  }
}
