

import 'package:flutter/material.dart';
import 'package:lift_note/utils/index.dart';

class HomeNewsItem extends StatelessWidget{

  final String title;
  final String time;
  final String image;
  final VoidCallback onTap;

  const HomeNewsItem({
    super.key, 
    required this.title, 
    required this.time, 
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(LScreenAdapter.width(28), 0, LScreenAdapter.width(28), LScreenAdapter.height(15)),
        child: Column(
          children: [
            Row(
              children: [
                _createLeftContainer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(LScreenAdapter.width(10)),
                  child: Image.network(
                    image,
                    width: LScreenAdapter.width(111), 
                    height: LScreenAdapter.height(66),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: LScreenAdapter.height(15)),
              child: Container(
                color: color_F5F5F5,
                height: LScreenAdapter.height(1),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createLeftContainer() {
    return SizedBox(
      width: LScreenAdapter.width(LScreenAdapter.kscreenWidth()  - LScreenAdapter.width(111 + 76)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: LScreenAdapter.fontSize(14),
                color: color_303943,
                fontWeight: FontWeight.w400
              ),
            ),

          Padding(
            padding: EdgeInsets.only(top: LScreenAdapter.height(2)),
            child: Text(
              time,
              style: TextStyle(
                fontSize: LScreenAdapter.fontSize(10),
                color: color_303943,
                fontWeight: FontWeight.w100
              ),
            ),
          )
        ],
      ),
    );
  }

}