import 'dart:collection';

import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

import '../update/update_completed_count_view_model.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final updatevm = Get.put(UpdateCompleteCountController());

  final rxRequestStatus = Status.LOADING.obs;
  RxList userList = [].obs; // this is succesious
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(List<Task> _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  makeCountList(List taskList){
    List countList = [];
    for (var i in taskList) {
      countList.add(i.completedCount);
    }
    updatevm.setList(countList);
  }

  void userListApi() {
    //  setRxRequestStatus(Status.LOADING);

    _api.TaskList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      makeCountList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.TaskList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      makeCountList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
