class HistoryPassword {
  final int? id;
  final String accountId; // 图标
  final String oldPassword;
  final String createTime; // 插入的时间
  final String updateTime; // 更新的时间

  const HistoryPassword(
      {this.id,
      required this.accountId,
      required this.oldPassword,
      required this.createTime,
      required this.updateTime});
}
