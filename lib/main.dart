import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:keep_account/databases/db_handler/add_account_handle.dart';
import 'package:keep_account/databases/models/account_model.dart';
import 'package:keep_account/pages/addPage.dart';
import 'package:keep_account/pages/searchPage.dart';
import 'package:keep_account/provider/pop_menu_provider.dart';
import 'package:keep_account/utils/colors.dart';
import 'package:keep_account/utils/handleList.dart';
import 'package:keep_account/widgets/HomeSideBarListView.dart';
import 'package:keep_account/widgets/passwordInfoBox.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:keep_account/utils/utils.dart';

void main() {
  // runApp(const MyApp());
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PopMenuProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '密码词典',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Colors.white.withOpacity(0.9)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<AccountModel> accountsList = [];

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    onLoadDB();
    initialization();
  }

  /// 强制刷新页面
  void _forceRefresh() {
    setState(() {
      _counter++;
    });
  }

  void onLoadDB() async {
    final accounts = await AccountDBProvider().query();
    accountsList.clear();
    accountsList.addAll(accounts);
    _forceRefresh();
  }

  // 首页启动页
  void initialization() async {
    // await Future.delayed(const Duration(seconds: 1));

    FlutterNativeSplash.remove();
  }

  void showSnack(String str, {int delay = 500}) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(str),
        duration: Duration(milliseconds: delay),
      ));

  /// 删除数据
  ///
  void onDeletePassword(BuildContext context, int id, String label) {
    if (label == 'onDelete') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('确定删除？'),
            actions: [
              TextButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop(); // 关闭对话框
                },
              ),
              TextButton(
                child: Text('确定'),
                onPressed: () {
                  final handleList = HandleList();
                  List<AccountModel> res =
                      handleList.removeOne(id, accountsList);
                  int list = 0;
                  for (int i = 0; i < accountsList.length; i++) {
                    if (accountsList[i].id == id) {
                      list = i;
                      break;
                    }
                  }
                  setState(() => accountsList.removeAt(list));
                  AccountDBProvider().delete(id);
                  Navigator.of(context).pop(); // 关闭对话框
                },
              ),
            ],
          );
        },
      );
    }
  }

  ScrollController mainListScrollControl = ScrollController();

  /*
  * 生成列表
  * */
  DraggableScrollableSheet _buildDraggableScrollableSheet(
      double screenWidth, int count, List<AccountModel> accountList) {
    final actionMotions = <Widget>[
      SlidableAction(
          label: '取消置顶',
          foregroundColor: Colors.blue,
          icon: Icons.hourglass_top_rounded,
          onPressed: (_) {}),
      SlidableAction(
          label: "隐藏",
          foregroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: (_) {})
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) {
        mainListScrollControl = scrollController;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEFEFEF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Scrollbar(
              child: Column(
            children: [
              Expanded(
                  child: GestureDetector(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: count,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                          key: Key(accountList[index].id.toString() ?? '0'),
                          startActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [actionMotions[0]],
                          ),
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [actionMotions[1]],
                          ),
                          child: PasswordInfoBox(
                            id: accountList[index].id ?? 0,
                            icon: accountList[index].icon,
                            width: screenWidth,
                            height: 120,
                            account: accountList[index].account,
                            appName: accountList[index].appname,
                            password: accountList[index].password,
                          ));
                    }),
              )),
            ],
          )),
        );
      },
    );
  }

  /*
  * ==========================================================================
  * */

  @override
  Widget build(BuildContext context) {
    PopMenuProvider menuProvider = Provider.of<PopMenuProvider>(context);

    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      onDeletePassword(
          context, menuProvider.currentAccountId, menuProvider.currentMenu);

      // 点击确定后清除原有记录
      menuProvider.changeMenu('', 0);
    });

    // 抽屉布局的头部
    // const drawerHeader = UserAccountsDrawerHeader(
    //   accountName: Text("Leewei"),
    //   accountEmail: Text(""),
    //   currentAccountPicture: CircleAvatar(
    //     backgroundColor: Colors.white,
    //     child: FlutterLogo(size: 42),
    //   ),
    // );

    Widget drawerHeader = Container(
      alignment: Alignment.centerLeft,
      width: 120,
      margin: const EdgeInsets.fromLTRB(20, 40, 0, 40),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/other/avatar.jpg"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: const Text(
              "leewei",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const Text("已经使用90天")
        ],
      ),
    );

    // 抽屉布局的内容部分
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: HomeSideBarLists.length,
          itemBuilder: (BuildContext context, int index) {
            return genIconAndTextButton(context, HomeSideBarLists[index].icon,
                HomeSideBarLists[index].label, HomeSideBarLists[index].router);
          },
        ),
        // const ListTile(
        //   title: Text("设置"),
        // ),
        // ListTile(title: const Text("退出"), onTap: () => SystemNavigator.pop())
      ],
    );

    // 获取屏幕宽度

    double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    double screenHeigh = window.physicalSize.height / window.devicePixelRatio;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          actions: [
            Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.green))
          ],
          actionsIconTheme: const IconThemeData(size: 25),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            // 顶部块包括欢迎词，搜索框
            Positioned(
                height: screenHeigh,
                child: Container(
                    width: screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 35, 0, 35),
                          child: const Text(
                            "美好从此刻开始",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF353535),
                                letterSpacing: 2,
                                fontFamily: 'FangZhengKaiTi'),
                          ),
                        ),
                        //  搜索框
                        Container(
                            width: screenWidth * 0.8,
                            margin: EdgeInsets.fromLTRB(
                                screenWidth * 0.1, 0, screenWidth * 0.1, 0),
                            child: Row(
                              children: [
                                ElevatedButton.icon(
                                  icon: Icon(Icons.search),
                                  label: Text("搜索"),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          return Colors.white; // 按钮默认的颜色
                                        },
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                              (states) =>
                                                  const EdgeInsets.fromLTRB(
                                                      35, 0, 35, 0))),
                                  onPressed: () {
                                    final result = Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchPage()),
                                    );
                                  },
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5)),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.add),
                                  label: Text("添加"),
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddPage()),
                                    );

                                    if (result == "addPage") {
                                      onLoadDB();
                                      _forceRefresh();
                                    }
                                  },
                                  style: ButtonStyle(
                                    textStyle: MaterialStateProperty
                                        .resolveWith<TextStyle>(
                                      (Set<MaterialState> states) {
                                        return const TextStyle(
                                          color: CustomColors.primary300,
                                        ); // 按钮默认的颜色
                                      },
                                    ),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        return CustomColors
                                            .primary100; // 按钮默认的颜色
                                      },
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    padding: MaterialStateProperty.resolveWith(
                                        (states) => const EdgeInsets.fromLTRB(
                                            40, 0, 40, 0)),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ))),
            //  具体内容区域
            _buildDraggableScrollableSheet(
                screenWidth, accountsList.length, accountsList)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: Drawer(
          width: screenWidth * 0.7,
          backgroundColor: Colors.white,
          child: drawerItems,
        ));
  }
}
