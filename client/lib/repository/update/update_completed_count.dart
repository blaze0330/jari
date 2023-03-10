import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';
import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';

class UpdateCompleteCountRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> updateCompletedCount(var data, String id , url) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "auth-token": await UserPreference()
          .getUser()
          .then((value) => value.toJson()['authtoken']),
    };
    dynamic response =
        await _apiService.putApi(data, url, headers);
    return response;
  }
}
