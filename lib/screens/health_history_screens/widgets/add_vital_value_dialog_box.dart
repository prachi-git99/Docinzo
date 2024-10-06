import 'package:doctor/consts/consts.dart';

import '../../../common_widgets/custom_botton_widget.dart';

Widget addVitalValueDialog(context) {
  var size = MediaQuery.of(context).size;
  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: appVerticalPadding, horizontal: appHorizontalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: size.width * 0.09,
                      child:
                          const TextField(keyboardType: TextInputType.number)),
                  const Text(
                    "  / ",
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                        color: fontGrey),
                  ),
                  SizedBox(
                      width: size.width * 0.09,
                      child:
                          const TextField(keyboardType: TextInputType.number)),
                ],
              ),
              const SizedBox(height: containerVerMargin),
              customButtonWidget(context, "Add", white, 16.0, () {
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    ),
  );
}
