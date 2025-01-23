
import 'package:get/get.dart';

//home
import 'package:lift_note/app/home/main/bindings/home_binding.dart';
import 'package:lift_note/app/home/main/views/home_view.dart';
//-- home -- pokedex
import '../app/home/pokedex/bindings/home_pokedex_binding.dart';
import '../app/home/pokedex/views/home_pokedex_view.dart';
//-- home -- pokedex -- detail
import '../app/home/detail/bindings/home_pokedex_detail_binding.dart';
import '../app/home/detail/views/home_pokedex_detail_view.dart';
//-- home -- chat
import '../app/home/chat/views/home_chat_view.dart';
import '../app/home/chat/bindings/home_chat_binding.dart';

//tab
import '../app/tabs/views/tabs_view.dart';
import '../app/tabs/bindings/tabs_binding.dart';

//login
import '../app/login/views/login_view.dart';
import '../app/login/bindings/login_binding.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static const LOGIN = Routes.LOGIN;

  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => TabsView(),
      binding: TabsBinding()
    ),

    //LOGIN
    GetPage(
      name: _Paths.LOGIN , 
      page: () => LoginView(),
      binding: LoginBinding()
    ),

    //HOME
    GetPage(
      name: _Paths.HOME, 
      page: () => const HomeView(),
      binding: HomeBinding()
    ),

    //HOME_CHAT
    GetPage(
      name: _Paths.HOME_CHAT, 
      page: () => const HomeChatView(),
      binding: HomeChatBinding()
    ),

    //HOME_POKEDEX
    GetPage(
      name: _Paths.HOME_POKEDEX, 
      page: () => HomePokedexView(),
      binding: HomePokedexBinding()
    ),

    //HOME_POKEDEX_DETAIL
    GetPage(
      name: _Paths.HOME_POKEDEX_DETAIL, 
      page: () => const HomePokedexDetailView(),
      binding: HomePokedexDetailBinding()
    ),
  ];
}