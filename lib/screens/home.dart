import 'package:doctor/screens/vital_screen/vital_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';
import '../controllers/home_controller.dart';
import 'health_record_screen/health_record_screen.dart';
import 'home_screen/home_screen.dart';
import 'notification_screen/notification_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  buildBottomNavigationBarItem(name, icon, controller, currentNavIndex) {
    return BottomNavigationBarItem(
        icon: Obx(
          () => SvgPicture.asset(
            icon,
            width: navBarIconSize,
            height: navBarIconSize,
            color: controller.currentNavIndex.value == currentNavIndex
                ? primaryColor
                : unselectedNavbarIcon,
          ),
        ),
        label: name);
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    List<BottomNavigationBarItem> navbarItem = [
      buildBottomNavigationBarItem(
          "Home", "assets/images/icons/navbar_icons/$homeIcon", controller, 0),
      buildBottomNavigationBarItem("Schedule",
          "assets/images/icons/navbar_icons/$scheduleIcon", controller, 1),
      buildBottomNavigationBarItem("Vitals",
          "assets/images/icons/navbar_icons/$vitalIcon", controller, 2),
      buildBottomNavigationBarItem("Notification",
          "assets/images/icons/navbar_icons/$notifyIcon", controller, 3),
    ];

    var navBody = [
      HomeScreen(),
      HealthScreen(),
      const VitalScreen(),
      const NotificationScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        // showDialog(
        //     barrierDismissible: false,
        //     context: context,
        //     builder: (context)=>exitDialog(context)
        // );
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
              () => navBody.elementAt(controller.currentNavIndex.value),
            ),
            Obx(
              () => Container(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(mediumBorderRadius),
                    topRight: Radius.circular(mediumBorderRadius),
                    // bottomRight: Radius.circular(mediumBorderRadius),
                    // bottomLeft: Radius.circular(mediumBorderRadius),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: BottomNavigationBar(
                        elevation: 5.0,
                        currentIndex: controller.currentNavIndex.value,
                        selectedItemColor: primaryColor,
                        unselectedItemColor: unselectedNavbarIcon,
                        backgroundColor: bgColor,
                        type: BottomNavigationBarType.fixed,
                        selectedLabelStyle: const TextStyle(
                            fontFamily: poppins,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                        unselectedLabelStyle:
                            TextStyle(fontFamily: poppins, fontSize: 10),
                        onTap: (value) {
                          controller.currentNavIndex.value = value;
                        },
                        items: navbarItem),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
