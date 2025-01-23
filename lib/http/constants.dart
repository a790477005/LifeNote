part of './request.dart';

const String HOST = '192.168.31.88';

const String pocketPort = '3000';

const String chatPort = '2048';

const String baseUrl = 'http://$HOST:$pocketPort';

const String socketUrl = 'ws://$HOST:$chatPort';

class Api {
  const Api._();

  static const getPokemonNewsList = '/getPokemonNewsList';

  static const getPokemonList = '/getPokemon';

  static const getPokemonDetail = '/getPokemonDetail';

  static const getPokemonEvolutions = '/getPokemonEvolutions';
  
}