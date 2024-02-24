import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/health_record_screen/appointment_screen/appointment_tab_screen.dart';
import 'package:doctor/screens/health_record_screen/record_screen/report_tab_screen.dart';
import 'package:get/get.dart';

import '../../components/responsive_text.dart';
import '../../controllers/home_controller.dart';

class HealthScreen extends StatelessWidget {
  HealthScreen({Key? key}) : super(key: key);

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.searchTabIndex.value,
      length: 2,
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            title: responsiveText(
                context: context,
                textColor: white,
                text: "Health Records",
                fontWeight: FontWeight.w500,
                size: 22.0),
            centerTitle: true,
            iconTheme: IconThemeData(color: white),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: myGradient,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(mediumBorderRadius))),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(mediumBorderRadius))),
            bottom: const TabBar(
              indicatorWeight: 3.0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: white,
              unselectedLabelColor: white,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: poppins,
                  color: white),
              labelColor: white,
              tabs: [Tab(text: "Reports"), Tab(text: "Appointments")],
            ),
          ),
          // appBar: searchAppbar(context),
          body: gradientBg(
              context: context,
              widget: TabBarView(
                  children: [ReportTabScreen(), AppointmentTabScreen()]))),
    );
  }
}
