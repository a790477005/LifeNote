import 'package:flutter/material.dart';

import 'package:lift_note/utils/index.dart';

class HomePokedexDetailAboutExcelView extends StatelessWidget {
  final String title;
  final String value;

  const HomePokedexDetailAboutExcelView({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: LScreenAdapter.width(88),
          child: Text(
            title,
            style: TextStyle(
              fontSize: LScreenAdapter.fontSize(14),
              fontWeight: FontWeight.normal,
              color: color_303943.withOpacity(0.4)
            )
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(LScreenAdapter.width(16), 0, 0, 0),
          child: Text(
            value,
            style: TextStyle(
                fontSize: LScreenAdapter.fontSize(14),
                fontWeight: FontWeight.normal,
                color: color_303943),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
