
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift_note/app/widget/index.dart';

import 'package:lift_note/extension/index.dart';
import 'package:lift_note/utils/index.dart';

import '../controllers/index.dart';

class HomePokedexDetailView extends GetView<HomePokedexDetailController> {
  const HomePokedexDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_F1F1F1,
        scrolledUnderElevation: 0.0,
        title: Padding(
          padding: EdgeInsets.fromLTRB(LScreenAdapter.width(28), 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context, 
                    builder: (context) => Obx( () => LAlertview(
                      margin: controller.viewModel.dialogMargin.value,
                      cancelBlock: () {
                        controller.cancel();
                      },

                      confirmBlock: () {
                        controller.changedAlertMargin();
                      },
                    )
                  ));
                },
                child: Image.asset(
                  ImageName.home_search_icon_png.img,
                  width: LScreenAdapter.width(23),
                  height: LScreenAdapter.width(23),
                ),
              ),
            ],
          ),
        ),
      ),
      body: NestedScrollView(
        controller: controller.scrollController,
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              primary: true,
              expandedHeight: LScreenAdapter.height(403),
              leading: Container(),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(67),
                  child: _buildBarTitle()),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: _buildFlexibleContainer(),
              ),
            ),
          ];
        },
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller.pageController,
          children: controller.pages,
          onPageChanged: (value) {
            controller.selectedIndexPage(value);
          },
        ),
      ),
    );
  }

  Widget _buildBarTitle() {
    return Obx(
      () => Container(
        color: controller.isWhite.value ? Colors.white : color_F1F1F1,
        child: Container(
          width: LScreenAdapter.kscreenWidth(),
          height: 67,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(LScreenAdapter.width(25)),
              topRight: Radius.circular(LScreenAdapter.width(25))
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(LScreenAdapter.width(25), LScreenAdapter.height(10), LScreenAdapter.width(25), 0),
            child: Column(
              children: [
                SizedBox(
                  height: 46,
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      ...List.generate(controller.viewModel.titleList.length, (index) {
                        return InkWell(
                          child: Obx(() => Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Text(
                                controller.viewModel.titleList[index].title,
                                style: TextStyle(
                                  fontSize: LScreenAdapter.fontSize(16),
                                  color: controller.viewModel.titleList[index].isSelected
                                      ? color_303943
                                      : color_F4F5F4,
                                ),
                              )),
                              Container(
                                width: LScreenAdapter.width(26),
                                height: LScreenAdapter.height(1),
                                color: controller.viewModel.titleList[index].isSelected ? color_6C79DB: Colors.transparent,
                              )
                            ],
                          ),),
                          onTap: () {
                            controller.selectedIndexPage(index);
                          },
                        );
                      })
                    ],
                  ),
                ),

                Container(
                  color: color_F4F5F4,
                  height: 1,
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _buildFlexibleContainer() {
    return Container(
      width: LScreenAdapter.kscreenWidth(),
      height: LScreenAdapter.height(403),
      color: color_F1F1F1,
      child: Column(
        children: [
          _buildTitleContainer(),
          _buildFunctionTitleContainer(),
          Expanded(
            child: Stack(
            children: [
              Positioned(
                  top: LScreenAdapter.height(177),
                  child: Container(
                    height: LScreenAdapter.height(46),
                    width: LScreenAdapter.kscreenWidth(),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(LScreenAdapter.width(25)),
                            topRight:
                                Radius.circular(LScreenAdapter.width(25)))),
                  )),
              Positioned(
                  left: LScreenAdapter.width(59),
                  child: Image.asset(
                    ImageName.zhongzi_png.img,
                    width: LScreenAdapter.width(378),
                    height: LScreenAdapter.height(223),
                  )),
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildTitleContainer() {
    return Padding(
      padding: EdgeInsets.all(LScreenAdapter.width(25)),
      child: SizedBox(
        height: LScreenAdapter.height(38),
        width: LScreenAdapter.kscreenWidth(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bulbasaur',
              style: TextStyle(
                  fontSize: LScreenAdapter.fontSize(36),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '#001',
              style: TextStyle(
                  fontSize: LScreenAdapter.fontSize(18),
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFunctionTitleContainer() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          LScreenAdapter.width(25),
          LScreenAdapter.height(9),
          LScreenAdapter.width(25),
          LScreenAdapter.height(9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: LScreenAdapter.height(28),
            child: Row(
              children: [
                Lcirclelabel(
                  text: "Grass",
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: LScreenAdapter.fontSize(12)),
                  color: Colors.white.withOpacity(0.5),
                  radius: 24,
                  padding:
                      EdgeInsets.symmetric(horizontal: LScreenAdapter.width(8)),
                  borderColor: color_FFFFFF_10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: LScreenAdapter.width(8)),
                  child: Lcirclelabel(
                    text: "Poison",
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: LScreenAdapter.fontSize(12)),
                    color: Colors.white.withOpacity(0.5),
                    radius: 24,
                    padding: EdgeInsets.symmetric(
                        horizontal: LScreenAdapter.width(8)),
                    borderColor: color_FFFFFF_10,
                  ),
                )
              ],
            ),
          ),
          Text(
            'Seed Pokemon',
            style: TextStyle(
                fontSize: LScreenAdapter.fontSize(14),
                color: Colors.white,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}