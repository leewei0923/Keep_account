class PresetModel {
  final int? id;
  final String presetName; // 图标
  final String content;
  final String createTime; // 插入的时间
  final String updateTime; // 更新的时间

  const PresetModel(
      {this.id,
      required this.presetName,
      required this.content,
      required this.createTime,
      required this.updateTime});
}
