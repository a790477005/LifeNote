
class HomeCategoryItemModel {
  String? name;
  String? icon;
  String? color;

  HomeCategoryItemModel({this.name, this.icon, this.color});

  HomeCategoryItemModel.fromJson(Map<String, dynamic> json) {}

  static List<HomeCategoryItemModel> createHomeCategoryItemList() {
    return [
      HomeCategoryItemModel(
          name: "Pokedex",
          icon: "ball_icon.png",
          color: "0xFFB1736C"
      ),
      HomeCategoryItemModel(
          name: "Movies",
          icon: "ball_icon.png",
          color: "0xFF7C538C"
      ),
      HomeCategoryItemModel(
          name: "Abilities",
          icon: "ball_icon.png",
          color: "0xFF58ABF6"
      ),
      HomeCategoryItemModel(
          name: "Items",
          icon: "ball_icon.png",
          color: "0xFFFFCE4B"
      ),
      HomeCategoryItemModel(
          name: "Locations",
          icon: "ball_icon.png",
          color: "0xFFF7786B"
      ),
      HomeCategoryItemModel(
          name: "Type Charts",
          icon: "ball_icon.png",
          color: "0xFF4FC1A6"
      )
    ];
  }
}



