import 'package:kqcnotebook/pages/Index/Index_view.dart';
import 'package:kqcnotebook/pages/app_my_section/mine/mine_binding.dart';
import 'package:kqcnotebook/pages/app_my_section/mine/mine_view.dart';
import 'package:kqcnotebook/pages/home/home.binding.dart';
import 'package:kqcnotebook/pages/home/home_view.dart';
import 'package:kqcnotebook/pages/login/login_binding.dart';
import 'package:kqcnotebook/pages/login/login_view.dart';
import 'package:kqcnotebook/pages/note_entry/note_entry_binding.dart';
import 'package:kqcnotebook/pages/notfound/notfound_view.dart';
import 'package:kqcnotebook/pages/proxy/proxy_view.dart';
import 'package:get/get.dart';
import '../pages/note_entry/note_entry_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Index;

  static final routes = [
    GetPage(
      name: AppRoutes.Index,
      page: () => IndexPage(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Entry,
      page: () => NoteEntryPage(),
      binding: NoteEntryBinding(),
    ),
    GetPage(
      name: AppRoutes.Mine,
      page: () => MinePage(),
      binding: MineBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundPage(),
  );

  static final proxyRoute = GetPage(
    name: AppRoutes.Proxy,
    page: () => ProxyPage(),
  );
}
