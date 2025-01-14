import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift_note/app/widget/index.dart';

import 'package:lift_note/utils/index.dart';
import 'package:lift_note/language/index.dart';
import 'package:lift_note/extension/index.dart';

import '../controllers/index.dart';
import './about/index.dart';

class HomePokedexDetailAboutView
    extends GetView<HomePokedexDetailAboutController> {
  const HomePokedexDetailAboutView({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Obx(() => Text(
                    (controller.viewModel.detailMsgModel.value.introduce ?? ''),
                    style: TextStyle(
                        color: color_303943,
                        fontSize: LScreenAdapter.fontSize(14),
                        fontWeight: FontWeight.bold),
                  )),
                  _createBodyContainer(),
                  _createBreedingContainer(),

                  SizedBox(
                    height: 50,
                    child: LinearProgressIndicator(
                      value: 0.25,
                      backgroundColor: color_F4F5F4,
                      valueColor: const AlwaysStoppedAnimation(Colors.green),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                    child: LServiceView(
                      resultBlock: (value) => debugPrint(value.toString()),
                    ),
                  )
                ]
              ),
            ),
          )
        ],
      ),
    );
  }

  //MARK: -- body Widget
  Widget _createBodyContainer() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, LScreenAdapter.height(28), 0, LScreenAdapter.height(31)),
      child: Container(
        width: LScreenAdapter.kscreenWidth() - LScreenAdapter.width(40),
        height: LScreenAdapter.height(72),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // 阴影颜色
              spreadRadius: 5, // 阴影扩散半径
              blurRadius: 5, // 阴影模糊半径
              offset: const Offset(0, 3), // 阴影偏移量
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
                child: Obx(() => HomePokedexDetailAboutBodyView(
                    title: HomePokedexDetailShowKeys.height.tr,
                    value: controller
                            .viewModel.detailMsgModel.value.body?.height ??
                        ''))),
            Expanded(
                child: Obx(() => HomePokedexDetailAboutBodyView(
                    title: HomePokedexDetailShowKeys.weight.tr,
                    value: controller
                            .viewModel.detailMsgModel.value.body?.weight ??
                        ''))),
          ],
        ),
      ),
    );
  }

  Widget _createBreedingContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomePokedexDetailShowKeys.breeding.tr,
          style: TextStyle(
              fontSize: LScreenAdapter.fontSize(16),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: LScreenAdapter.kscreenWidth() - LScreenAdapter.width(40),
          height: LScreenAdapter.height(50),
          child: Row(
            children: [
              SizedBox(
                width: LScreenAdapter.width(88),
                child: Text(HomePokedexDetailShowKeys.gender.tr,
                    style: TextStyle(
                        fontSize: LScreenAdapter.fontSize(14),
                        fontWeight: FontWeight.normal,
                        color: color_303943.withOpacity(0.4))),
              ),
              Padding(
                padding: EdgeInsets.only(left: LScreenAdapter.width(16)),
                child: SizedBox(
                  width: LScreenAdapter.width(63),
                  height: LScreenAdapter.height(15),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageName.man_png.img,
                        width: LScreenAdapter.width(17),
                        height: LScreenAdapter.height(14),
                      ),
                      Obx(() => Text(
                          controller.viewModel.detailMsgModel.value.breed
                                  ?.gender?.male ??
                              '',
                          style: TextStyle(
                            fontSize: LScreenAdapter.fontSize(14),
                            fontWeight: FontWeight.normal,
                            color: color_303943.withOpacity(0.4)
                          )
                        )
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: LScreenAdapter.width(14)),
                child: SizedBox(
                  width: LScreenAdapter.width(63),
                  height: LScreenAdapter.height(15),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageName.women_png.img,
                        width: LScreenAdapter.width(17),
                        height: LScreenAdapter.height(14),
                      ),
                      Obx(() => Text(
                          controller.viewModel.detailMsgModel.value.breed
                                  ?.gender?.female ??
                              '',
                          style: TextStyle(
                            fontSize: LScreenAdapter.fontSize(14),
                            fontWeight: FontWeight.normal,
                            color: color_303943.withOpacity(0.4)
                          )
                        )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: LScreenAdapter.kscreenWidth() - LScreenAdapter.width(40),
          height: LScreenAdapter.height(32),
          child: Obx(() => HomePokedexDetailAboutExcelView(
              title: HomePokedexDetailShowKeys.eggGroup,
              value:
                  controller.viewModel.detailMsgModel.value.breed?.eggGroup ??
                      '')),
        ),
        SizedBox(
          width: LScreenAdapter.kscreenWidth() - LScreenAdapter.width(40),
          height: LScreenAdapter.height(32),
          child: Obx(() => HomePokedexDetailAboutExcelView(
              title: HomePokedexDetailShowKeys.eggCycle,
              value:
                  controller.viewModel.detailMsgModel.value.breed?.eggCycle ??
                      '')),
        )
      ],
    );
  }
}
