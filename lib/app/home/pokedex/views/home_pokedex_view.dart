import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:lift_note/app/widget/index.dart';

import 'package:lift_note/utils/index.dart';
import 'package:lift_note/extension/index.dart';
import 'package:lift_note/language/index.dart';
import 'package:lift_note/routes/app_pages.dart';

import '../controller/home_pokedex_controller.dart';
import '../views/home_pokedex_item.dart';
import './home_pokedex_sheet_view.dart';

class HomePokedexView extends GetView<HomePokedexController> {
  HomePokedexView({super.key});

  final scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    debugPrint('$keyboardSize');
    return Scaffold(
      key: scafoldKey,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
              top: -LScreenAdapter.kNavigationHeight(),
              width: LScreenAdapter.kscreenWidth(),
              height: LScreenAdapter.kscreenHeight() +
                  LScreenAdapter.kNavigationHeight(),
              child: Container(
                color: color_E5E5E5,
                child: Stack(
                  children: [
                    _createTopBgContainer(),
                    _createGridContainer(),
                    Positioned(
                        bottom: LScreenAdapter.height(36),
                        right: LScreenAdapter.width(-12),
                        child: InkWell(
                          child: Image.asset(
                            ImageName.pokemon_float_btn_png.img,
                            width: LScreenAdapter.width(120),
                            height: LScreenAdapter.width(120),
                          ),
                          onTap: () {
                            controller.controlOptionShow(
                                !controller.viewModel.isShowOption.value);
                          },
                        )),
                    _createOptionContainer(context)
                  ],
                ),
              ))
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              controller.back();
            },
            icon: Image.asset(ImageName.back_png.img)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: LScreenAdapter.width(16)),
            child: IconButton(
              icon: const Icon(Icons.access_alarms), // 添加搜索按钮
              onPressed: () {
                // 点击搜索按钮触发的操作
                controller.moreClick();
              },
            ),
          )
        ],
      ),
    );
  }

  //MARK: 顶部背景
  Widget _createTopBgContainer() {
    return Positioned(
        top: LScreenAdapter.kNavigationHeight() - LScreenAdapter.height(44),
        right: -LScreenAdapter.width(86),
        width: LScreenAdapter.height(249),
        height: LScreenAdapter.height(249),
        child: Image.asset(ImageName.ball_top_bg_icon_png.img));
  }

  //MARK: 表格
  Widget _createGridContainer() {
    return Positioned(
        top: LScreenAdapter.kNavigationHeight() +
            LScreenAdapter.kNavigationHeight(),
        width: LScreenAdapter.kscreenWidth(),
        height:
            LScreenAdapter.kscreenHeight() - LScreenAdapter.kNavigationHeight(),
        child: EasyRefresh(
            onLoad: () async {
              bool isNoreMore =
                  await controller.getPokedexList(isLoadMore: true);
              if (isNoreMore) {
                return IndicatorResult.noMore;
              }
            },
            onRefresh: () async {
              await controller.getPokedexList(isLoadMore: false);
            },
            child: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(
                    LScreenAdapter.width(26), LScreenAdapter.height(20), 0, 0),
                child: Text(
                  HomePokedexShowKeys.pokedex.tr,
                  style: TextStyle(
                      fontSize: LScreenAdapter.fontSize(30),
                      color: color_303943),
                ),
              )),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(LScreenAdapter.width(26),
                    LScreenAdapter.height(20), LScreenAdapter.width(26), 0),
                sliver: Obx(() => SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: LScreenAdapter.width(155),
                          crossAxisSpacing: LScreenAdapter.width(10),
                          childAspectRatio: 155 / 110),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: LScreenAdapter.height(10)),
                            child: HomePokedexItem(
                              title: controller.viewModel.pokedexList[index].name ?? '',
                              functionList:
                                  controller.viewModel.pokedexList[index].habits ?? [],
                              bgColorList:
                                  controller.viewModel.pokedexList[index].bgColor ?? [],
                              itemBgColor: '0xFFFFFFFF',
                              itemBgColorOpacity: 0.1,
                              image:
                                  controller.viewModel.pokedexList[index].image ?? '',
                            ),
                          ),
                          onTap: () {
                            controller.clickIndexItem(index);
                          },
                        );
                      }, childCount: controller.viewModel.pokedexList.length),
                    )),
              ),
            ])));
  }

  //MARK: -- 蒙版
  Widget _createOptionContainer(context) {
    return Positioned(
        top: 0,
        left: 0,
        width: LScreenAdapter.kscreenWidth(),
        height:
            LScreenAdapter.kscreenHeight() + LScreenAdapter.kNavigationHeight(),
        child: Obx(
          () => Visibility(
              visible: controller.viewModel.isShowOption.value,
              maintainAnimation: false,
              child: InkWell(
                child: Container(
                  color: color_000000_50,
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: LScreenAdapter.height(35),
                          width: LScreenAdapter.kscreenWidth() -
                              LScreenAdapter.width(26),
                          right: LScreenAdapter.width(26),
                          height: LScreenAdapter.height(249),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ...List.generate(
                                  controller.viewModel.menuModelList.length,
                                  (index) {
                                return Column(
                                  children: [
                                    LTextIconBtn(
                                      height: LScreenAdapter.height(36),
                                      text: controller
                                          .viewModel.menuModelList[index].title,
                                      textStyle: TextStyle(
                                          color: color_303943, fontSize: 14),
                                      radius: 20,
                                      backgroundColor: const [Colors.white],
                                      padding: EdgeInsets.fromLTRB(
                                          LScreenAdapter.width(24),
                                          0,
                                          LScreenAdapter.width(10),
                                          0),
                                      spaceMargin: 14,
                                      iconName: controller.viewModel
                                          .menuModelList[index].imageName,
                                      iconWidth: LScreenAdapter.width(14),
                                      iconHeight: LScreenAdapter.height(13),
                                      position:
                                          LTextIconPosition.TextLeftIconRight,
                                      onTap: () {
                                        controller.controlOptionShow(false);
                                        showModalBottomSheet(
                                          // enableDrag: false,
                                            context: context, 
                                            builder: (context) {
                                            switch (index) {
                                              case 0: 
                                              return const HomePokedexGenerdationView();
                                              default:
                                              return HomePokedexSearchView(
                                                textEditingController: controller.searchInputController,
                                                onSubmitted: (value){}
                                              );
                                            }
                                          }
                                        );

                                      },
                                    ),
                                    SizedBox(
                                      height: index == controller.viewModel.menuModelList.length - 1 ? 0 : LScreenAdapter.height(11)
                                    )
                                  ],
                                );
                              }),
                            ],
                          )),

                          Positioned(
                            right: LScreenAdapter.width(26),
                            width: LScreenAdapter.width(45),
                            height: LScreenAdapter.width(45),
                            bottom: LScreenAdapter.height(35),
                            child: InkWell(
                              onTap: () {
                                controller.controlOptionShow(false);
                              },
                              child: SizedBox(
                                width: LScreenAdapter.width(45),
                                height: LScreenAdapter.width(45),
                                child: Image.asset(ImageName.pokemon_close_float_btn_png.img , fit: BoxFit.cover,),
                              ),
                            )
                          )
                    ],
                  ),
                ),
                onTap: () => controller.controlOptionShow(false),
              )),
        ));
  }
}
