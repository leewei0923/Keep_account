class AccountModel {
  final int? id;
  final String icon; // 图标
  final String appname;
  final String account; // 账号
  final String password; // 密码
  final String insertTime; // 插入的时间
  final String updateTime; // 更新的时间
  final int? isHide; // 是否在首页隐藏
  final int? isTop; // 是否置顶


  const AccountModel({
    this.id,
    required this.icon,
    required this.appname,
    required this.account,
    required this.password,
    required this.insertTime,
    required this.updateTime,
    this.isHide,
    this.isTop
  });
}
