import 'package:mashe/core/export_core.dart';
import 'package:mashe/ui/dashboard_module/pages/home_screen.dart';

class DashboardController extends GetxController{

  RxInt selectedNavItem = RxInt(0);

  RxList<Widget> pages = RxList<Widget>([
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container()
  ]);

}