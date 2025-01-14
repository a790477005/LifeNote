
import 'package:flutter/material.dart';
import 'package:lift_note/utils/index.dart';

import 'package:lift_note/app/widget/index.dart';

class HomePokedexItem extends StatelessWidget{

  final String title;
  final List<String> functionList;
  final List<String> bgColorList;
  final String image;
  final String itemBgColor;
  late double? itemBgColorOpacity;
  late VoidCallback? onTap;

  HomePokedexItem({
    super.key, 
    required this.title, 
    required this.functionList,
    required this.bgColorList,
    required this.image,
    required this.itemBgColor,
    this.itemBgColorOpacity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: bgColorList.map((color) => Color(int.parse(color))).toList()
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: LScreenAdapter.height(24),
              left: LScreenAdapter.width(16),
              right: LScreenAdapter.width(16),
              bottom: LScreenAdapter.height(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: LScreenAdapter.fontSize(14)
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, LScreenAdapter.height(10), LScreenAdapter.width(16), 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: functionList.map((item) => Padding(
                        padding: EdgeInsets.only(top: LScreenAdapter.height(4)),
                          child: Lcirclelabel(
                            text: item,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: LScreenAdapter.fontSize(12)
                            ),
                            color: Color(int.parse(itemBgColor)).withOpacity(itemBgColorOpacity ?? 0.0),
                            radius: 24,
                            padding: EdgeInsets.symmetric(horizontal: LScreenAdapter.width(8)),
                            borderColor: color_FFFFFF_10,
                          )
                        ),
                      ).toList(),
                    ),
                  )
                ],
              ),
            ),

            Positioned(
                right: LScreenAdapter.width(7),
                bottom: LScreenAdapter.height(7),
                child: Image.network(
                  image, 
                  width: LScreenAdapter.width(76), 
                  height: LScreenAdapter.height(71),
                  fit: BoxFit.cover
                ),
              )          
            ],
        ),
      )
    );
  }
}