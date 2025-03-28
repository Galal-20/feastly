
import 'package:feastly/src/features/profile/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // To convert to/from JSON

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize the cache
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! Save data in local storage using key
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! Get data from local storage
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! Remove data using specific key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Check if local storage contains key
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData({required String key}) async {
    return sharedPreferences.clear();
  }

  //! Save UserModel in local storage
  Future<bool> saveUserModel(UserModel user) async {
    String userJson = jsonEncode(user.toJson());
    return await sharedPreferences.setString('user', userJson);
  }

  //! Get UserModel from local storage
  UserModel? getUserModel() {
    String? userJson = sharedPreferences.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  //! Save any data using the put method
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}
