import 'package:doctor/consts/consts.dart';

import '../components/responsive_text.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/gif/$fileUploadGif",
                width: size.width * 0.4,
              ),
              responsiveText(
                  context: context,
                  text: 'Uploading your file...',
                  textColor: black,
                  fontWeight: FontWeight.w500,
                  size: 16.0)
            ],
          ),
        ),
      ),
    );
  }
}
