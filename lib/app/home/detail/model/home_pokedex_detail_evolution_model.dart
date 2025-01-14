
class HomePokedexDetailEvolutionModel {
  List<EvolutionChain>? evolutionChain;
  List<EvolutionChain>? megaEvolution;

  HomePokedexDetailEvolutionModel({this.evolutionChain, this.megaEvolution});

  HomePokedexDetailEvolutionModel.fromJson(Map<String, dynamic> json) {
    if (json['evolutionChain'] != null) {
      evolutionChain = <EvolutionChain>[];
      json['evolutionChain'].forEach((v) {
        evolutionChain!.add(new EvolutionChain.fromJson(v));
      });
    }
    if (json['megaEvolution'] != null) {
      megaEvolution = <EvolutionChain>[];
      json['megaEvolution'].forEach((v) {
        megaEvolution!.add(new EvolutionChain.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.evolutionChain != null) {
      data['evolutionChain'] =
          this.evolutionChain!.map((v) => v.toJson()).toList();
    }
    if (this.megaEvolution != null) {
      data['megaEvolution'] =
          this.megaEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EvolutionChain {
  String? child;
  String? childIcon;
  String? lever;
  String? group;
  String? groupIcon;

  EvolutionChain(
      {this.child, this.childIcon, this.lever, this.group, this.groupIcon});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    child = json['child'];
    childIcon = json['childIcon'];
    lever = json['lever'];
    group = json['group'];
    groupIcon = json['groupIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child'] = this.child;
    data['childIcon'] = this.childIcon;
    data['lever'] = this.lever;
    data['group'] = this.group;
    data['groupIcon'] = this.groupIcon;
    return data;
  }
}
