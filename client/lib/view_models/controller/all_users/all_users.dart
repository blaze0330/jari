import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/getallusers/get_all_users.dart';

import 'package:getx_mvvm/repository/get_all_user_repository/get_all_users_repository';

import '../update/update_completed_count_view_model.dart';

class AllUsersController extends GetxController {
  final _api = AllUsersRepository();


  final rxRequestStatus = Status.LOADING.obs;
  RxList userList = [].obs; // this is succesious
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(List<dynamic> _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

 

  void AlluserListApi() {
    //  setRxRequestStatus(Status.LOADING);

    _api.UserList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.UserList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
 
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
