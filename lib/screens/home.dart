import 'package:doctor/screens/report_screen/report_screen.dart';
import 'package:doctor/screens/schedule_screen/schedule_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../consts/consts.dart';
import '../controllers/home_controller.dart';
import 'home_screen/home_screen.dart';
import 'notification_screen/notification_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Obx(
            () => SvgPicture.asset(
              "assets/images/icons/navbar_icons/$homeIcon",
              width: navBarIconSize,
              height: navBarIconSize,
              color: controller.currentNavIndex.value == 0
                  ? primaryColor
                  : unselectedNavbarIcon,
            ),
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Obx(
            () => SvgPicture.asset(
              "assets/images/icons/navbar_icons/$scheduleIcon",
              width: navBarIconSize,
              height: navBarIconSize,
              color: controller.currentNavIndex.value == 1
                  ? primaryColor
                  : unselectedNavbarIcon,
            ),
          ),
          label: "Schedule"),
      BottomNavigationBarItem(
          icon: Obx(
            () => SvgPicture.asset(
              "assets/images/icons/navbar_icons/$reportIcon",
              width: navBarIconSize,
              height: navBarIconSize,
              color: controller.currentNavIndex.value == 2
                  ? primaryColor
                  : unselectedNavbarIcon,
            ),
          ),
          label: "Vitals"),
      BottomNavigationBarItem(
          icon: Obx(
            () => SvgPicture.asset(
              "assets/images/icons/navbar_icons/$notifyIcon",
              width: navBarIconSize,
              height: navBarIconSize,
              color: controller.currentNavIndex.value == 3
                  ? primaryColor
                  : unselectedNavbarIcon,
            ),
          ),
          label: "Notification"),
    ];
    var navBody = [
      const HomeScreen(),
      const ScheduleScreen(),
      const ReportScreen(),
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
                        unselectedLabelStyle: TextStyle(fontFamily: poppins, fontSize: 10),
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
