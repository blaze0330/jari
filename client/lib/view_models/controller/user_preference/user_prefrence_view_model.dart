

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {

    Future<bool> saveUser(UserModel responseModel)async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('token', responseModel.token.toString());
      sp.setBool('success', responseModel.success!);
      // print("saved user");
      return true ;
    }

    Future<UserModel> getUser()async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString('token');
      bool? success = sp.getBool('success');

      return UserModel(
        token: token ,
        success: success
      ) ;
    }

    Future<bool> removeUser()async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.clear();
      return true ;
    }
}