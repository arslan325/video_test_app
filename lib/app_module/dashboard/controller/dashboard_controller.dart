import 'package:get/get.dart';

class DashboardController extends GetxController {
  var loader = false.obs;

  //  Bottom Bar Variables

  var bottomSelectedIndex = 1.obs;
  updateBottomSelectedIndex(int index) {
    bottomSelectedIndex.value = index;
    update();
  }

  //
}
