extension ImageLoad on String {
  String get img => 'assets/images/$this';

  /// 获取 icon 全路径
  String get icon => 'assets/icons/$this';
}