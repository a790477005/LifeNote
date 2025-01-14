import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_pokedex_detail_title_model.g.dart';

List<HomePokedexDetailTitleModel> getHomePokedexDetailTitleModelList(List<dynamic> list){
    List<HomePokedexDetailTitleModel> result = [];
    list.forEach((item){
      result.add(HomePokedexDetailTitleModel.fromJson(item));
    });
    return result;
  }
@JsonSerializable()
  class HomePokedexDetailTitleModel extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'isSelected')
  bool isSelected;

  HomePokedexDetailTitleModel(this.title,this.isSelected,);

  factory HomePokedexDetailTitleModel.fromJson(Map<String, dynamic> srcJson) => _$HomePokedexDetailTitleModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomePokedexDetailTitleModelToJson(this);

}

  
