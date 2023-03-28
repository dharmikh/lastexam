import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Home_controller extends GetxController {
  Rx<TextEditingController> txtloginemail = TextEditingController().obs;
  Rx<TextEditingController> txtloginpass = TextEditingController().obs;

  Rx<TextEditingController> txtSignemail = TextEditingController().obs;
  Rx<TextEditingController> txtSignpass = TextEditingController().obs;

  Rx<GlobalKey<FormState>> txtkey = GlobalKey<FormState>().obs;
}
