import 'package:doctor/consts/consts.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: primaryColor),
      ),
    );
  }
}
