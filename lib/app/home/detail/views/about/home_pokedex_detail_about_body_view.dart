import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lift_note/utils/index.dart';
import 'package:lift_note/language/index.dart';

class HomePokedexDetailAboutBodyView extends StatelessWidget {
  final String title;
  final String value;

  const HomePokedexDetailAboutBodyView({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              LScreenAdapter.width(16), LScreenAdapter.height(20), 0, 0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: LScreenAdapter.fontSize(14),
              fontWeight: FontWeight.normal,
              color: color_303943.withOpacity(0.4))
            ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(LScreenAdapter.width(16), 0, 0, 0),
          child: Text(
            value,
            style: TextStyle(
              fontSize: LScreenAdapter.fontSize(14),
              fontWeight: FontWeight.normal,
              color: color_303943
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
