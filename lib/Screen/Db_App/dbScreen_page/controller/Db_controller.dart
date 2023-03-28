import 'package:get/get.dart';
import 'package:lastexam/utils/helper_class/Database/Db_helper.dart';

class Db_controller extends GetxController
{

  RxList Datalist = [].obs;


  Future<void> getdata()
  async {
    Datalist.value = await DBHelper.dbHelper.readDB();
  }
}
