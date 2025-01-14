part of './request.dart';

const String baseUrl = 'http://192.168.31.88:3000';

class Api {
  const Api._();

  static const getPokemonNewsList = '/getPokemonNewsList';

  static const getPokemonList = '/getPokemon';

  static const getPokemonDetail = '/getPokemonDetail';

  static const getPokemonEvolutions = '/getPokemonEvolutions';
  
}