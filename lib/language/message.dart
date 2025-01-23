
import 'local.dart';
import 'package:get/get.dart';

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //大版面文案
          LocalShowKeys.primary : 'Primary',
          LocalShowKeys.followerSystemLanguage : 'Follower system Language',
          LocalShowKeys.languageSetting : 'Multilingual setup',
          LocalShowKeys.simplifiedChinese : 'Simplified Chinese',
          LocalShowKeys.mine : 'Mine',
          LocalShowKeys.application : 'LifeNote',
          LocalShowKeys.note : 'Note',
          LocalShowKeys.search : 'Search',
          LocalShowKeys.send : 'send',

          //首页文案
          HomeShowKeys.questionTitle : 'What Pokemon are you looking for?',
          HomeShowKeys.searchPlaceholder : 'Search Pokemon, Move, Ability etc',
          HomeShowKeys.viewAll : 'View All',
          HomeShowKeys.listTitle : 'Pokémon News',

          //首页 -- 宝可梦列表页文案
          HomePokedexShowKeys.pokedex : 'Pokedex',
          HomePokedexShowKeys.favouritePokemon : 'Favourite Pokemon',
          HomePokedexShowKeys.allGen : 'All Gen',
          HomePokedexShowKeys.allType : 'All Type',

          //首页 -- 宝可梦列表详情页文案
          HomePokedexDetailShowKeys.height : 'Height',
          HomePokedexDetailShowKeys.weight : 'Weight',
          HomePokedexDetailShowKeys.about : 'About',
          HomePokedexDetailShowKeys.baseStats : 'BaseStats',
          HomePokedexDetailShowKeys.evolution : 'Evolution',
          HomePokedexDetailShowKeys.movies : 'Movies',
          HomePokedexDetailShowKeys.breeding : 'Breeding',

          //首页 -- 聊天文案
          HomeChatShowKeys.chatHint : 'Talk'
          
        },
        'zh_CN': {
          //大版面文案
          LocalShowKeys.primary : '隐私',
          LocalShowKeys.followerSystemLanguage : '跟随系统',
          LocalShowKeys.languageSetting : '语言设置',
          LocalShowKeys.simplifiedChinese : '简体中文',
          LocalShowKeys.mine : '我的',
          LocalShowKeys.application : '生活好记本',
          LocalShowKeys.note : '记账',
          LocalShowKeys.search : '搜索',
          LocalShowKeys.send : '发送',

          //首页文案
          HomeShowKeys.questionTitle : '你正在寻找什么宝可梦?',
          HomeShowKeys.searchPlaceholder : '搜索例如：宝可梦，电影，游戏等...',
          HomeShowKeys.viewAll : '查看所有',
          HomeShowKeys.listTitle : '宝可梦新闻',

          //首页 -- 宝可梦列表页文案
          HomePokedexShowKeys.pokedex : '宝可梦',
          HomePokedexShowKeys.favouritePokemon : '最喜欢的宝可梦',
          HomePokedexShowKeys.allGen : '所有的宝石',
          HomePokedexShowKeys.allType : '所有的类型',

          //首页 -- 宝可梦列表详情页文案
          HomePokedexDetailShowKeys.height : '身高',
          HomePokedexDetailShowKeys.weight : '体重',
          HomePokedexDetailShowKeys.about : '关于',
          HomePokedexDetailShowKeys.baseStats : '基础状态',
          HomePokedexDetailShowKeys.evolution : '进化',
          HomePokedexDetailShowKeys.movies : '电影',
          HomePokedexDetailShowKeys.breeding : '物种',

          //首页 -- 聊天文案
          HomeChatShowKeys.chatHint : '聊一聊'
        }
      };
}