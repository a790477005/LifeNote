
// library AppRoutes;

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const TABS = _Paths.TABS;
  
  // Primary
  static const PRIMARY = _Paths.PRIMARY_MAIN;

  //Note 
  static const NOTE = _Paths.NOTE_MAIN;
  
  //Mine
  static const MINE = _Paths.MINE_MAIN;

  //Lgin
  static const LOGIN = _Paths.LOGIN;

  //Hone 
  static const HOME = _Paths.HOME;

  static const HOME_POKEDEX = _Paths.HOME_POKEDEX;

  static const HOME_POKEDEX_DETAIL = _Paths.HOME_POKEDEX_DETAIL;
}

abstract class _Paths {
  _Paths._();

  static const TABS = '/tabs';

  //Primary
  static const PRIMARY_MAIN = '/primary-main';
  
  //Note
  static const NOTE_MAIN = '/note-main';
  
  //Mine
  static const MINE_MAIN = '/mine-main';

  //Lgin
  static const LOGIN = '/login-main';

  //Home
  static const HOME = '/home-main';

  static const HOME_POKEDEX = '/home-pokedex';

  static const HOME_POKEDEX_DETAIL = '/home-pokedex-detail';
}