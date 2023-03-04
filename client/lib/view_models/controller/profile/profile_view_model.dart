
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/getuser/get_user_model.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/get_user_repository/get_user_repository.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class GetUserController extends GetxController {

  final _api = GetUserRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final user =GetUserModel().obs ;// this is succesious
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUser(GetUserModel _value) => user.value = _value ;
  void setError(String _value) => error.value = _value ;


  void userListApi(){
  //  setRxRequestStatus(Status.LOADING);

    _api.getUser().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUser(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  void refreshApi(){

      setRxRequestStatus(Status.LOADING);

    _api.getUser().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUser(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}