import 'package:flutter/material.dart';
import 'package:flutter_util_code/utils.dart';
import 'package:get/get.dart';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';

import '../../../../utils/index.dart';
import '../../../../language/index.dart';
import '../../../../extension/index.dart';
import './home_news_view/index.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //空白处就关闭键盘
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: color_E5E5E5,
        body: Stack(
          children: [
            Positioned(
              height: LScreenAdapter.kscreenHeight(),
              width: LScreenAdapter.kscreenWidth(),
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                onLoading: () async {
                  controller.getNewsList(isLoadMore: true);
                },
                onRefresh: () async {
                  controller.getNewsList(isLoadMore: false);
                },
                controller: controller.refreshController,
                child: CustomScrollView(
                  controller: controller.scrollController,
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverToBoxAdapter(
                      child: _createTopContainer(),
                    ),
                    Obx(() => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            switch (index) {
                              case 0:
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      LScreenAdapter.width(28),
                                      0,
                                      LScreenAdapter.width(28),
                                      0),
                                  child: Container(
                                    height: LScreenAdapter.height(58),
                                    color: color_E5E5E5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          HomeShowKeys.listTitle.tr,
                                          style: TextStyle(
                                              fontSize:
                                                  LScreenAdapter.fontSize(20),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        InkWell(
                                          child: Text(HomeShowKeys.viewAll.tr,
                                              style: TextStyle(
                                                fontSize:
                                                    LScreenAdapter.fontSize(14),
                                                fontWeight: FontWeight.w300,
                                                color: color_6C79DB,
                                              )),
                                          onTap: () {
                                            //查看全部
                                            controller.ToChatVC();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              default:
                                return Obx(() => HomeNewsItem(
                                      title: controller.homeViewModel
                                          .newsList[index - 1].title!,
                                      time: controller.homeViewModel
                                          .newsList[index - 1].time!,
                                      image: controller.homeViewModel
                                          .newsList[index - 1].image!,
                                      onTap: () {
                                        debugPrint('点击了$index');
                                      },
                                    ));
                            }
                          },
                          childCount:
                              controller.homeViewModel.newsList.length + 1,
                        )
                      )
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                height: LScreenAdapter.kNavigationHeight(),
                width: LScreenAdapter.kscreenWidth(),
                child: Obx(() => Container(
                      color: Color.fromRGBO(255, 255, 255,
                          controller.homeViewModel.barTintColor.value),
                    )))
          ],
        ),
      ),
    );
  }

  //MARK: 构造顶部容器
  Widget _createTopContainer() {
    return SizedBox(
      width: LScreenAdapter.kscreenWidth(),
      height: LScreenAdapter.height(585),
      child: Column(
        children: [_createTopTitleContainer()],
      ),
    );
  }

  Widget _createTopTitleContainer() {
    return SizedBox(
      width: LScreenAdapter.kscreenWidth(),
      height: LScreenAdapter.height(585),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              top: LScreenAdapter.height(126),
              left: LScreenAdapter.width(27),
              right: LScreenAdapter.width(27),
              height: LScreenAdapter.height(82),
              child: Text(
                HomeShowKeys.questionTitle.tr,
                style: TextStyle(
                    fontSize: LScreenAdapter.fontSize(30),
                    fontWeight: FontWeight.w400),
                maxLines: 2, // 设置最多显示两行
                overflow: TextOverflow.ellipsis, // 超出部分用省略号表示
              ),
            ),
            Positioned(
              width: LScreenAdapter.width(249),
              height: LScreenAdapter.width(249),
              right: LScreenAdapter.width(-95),
              top: LScreenAdapter.height(-65),
              child: Image.asset(ImageName.ball_top_bg_icon_png.img),
            ),
            Positioned(
                top: LScreenAdapter.height(230),
                left: LScreenAdapter.width(25),
                right: LScreenAdapter.width(25),
                child: Container(
                  width: LScreenAdapter.width(
                      LScreenAdapter.kscreenWidth() - LScreenAdapter.width(50)),
                  height: LScreenAdapter.height(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: color_F5F5F5,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Image.asset(
                          ImageName.home_search_icon_png.img,
                          width: LScreenAdapter.width(23),
                          height: LScreenAdapter.height(28),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: TextField(
                          cursorColor: color_303943,
                          controller: controller.searchVC,
                          decoration: InputDecoration(
                            hintText: HomeShowKeys.searchPlaceholder.tr,
                            hintStyle: TextStyle(
                              color: color_303943,
                              fontSize: LScreenAdapter.fontSize(14),
                            ),
                            border: InputBorder.none,
                          ),
                          onSubmitted: (value) {
                            LogUtils.println(value);
                          },
                        ),
                      ))
                    ],
                  ),
                )),
            Positioned(
                top: LScreenAdapter.height(312),
                left: LScreenAdapter.width(28),
                right: LScreenAdapter.width(28),
                height: LScreenAdapter.height(214),
                child: SizedBox(
                  child: Wrap(
                      spacing: LScreenAdapter.width(10),
                      runSpacing: LScreenAdapter.height(10),
                      children: controller.homeViewModel.categoryItemList
                          .asMap()
                          .entries
                          .map((entry) {
                        int index = entry.key;
                        var item = entry.value;
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(int.parse(item.color!))
                                    .withOpacity(0.4), // 阴影颜色和透明度
                                spreadRadius: 2, // 阴影扩散半径
                                blurRadius: 5, // 阴影模糊半径
                                offset: const Offset(0, 3), // 阴影偏移量
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(int.parse(item.color!)),
                          ),
                          height: LScreenAdapter.height(64),
                          width: (LScreenAdapter.kscreenWidth() -
                                  LScreenAdapter.width(68)) /
                              2,
                          child: InkWell(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: LScreenAdapter.width(16),
                                  top: LScreenAdapter.height(24),
                                  child: Text(
                                    item.name!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: LScreenAdapter.fontSize(14)),
                                  ),
                                ),
                                Positioned(
                                  right: LScreenAdapter.width(-20),
                                  top: LScreenAdapter.height(-10),
                                  child: Image.asset(item.icon!.img),
                                )
                              ],
                            ),
                            onTap: () {
                              controller.topCatecoryItemClick(index);
                            },
                          ),
                        );
                      }).toList()),
                ))
          ],
        ),
      ),
    );
  }
}
