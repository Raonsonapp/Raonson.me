import 'dart:convert';
import '../core/api.dart';
import '../core/http_service.dart';
import '../models/user.dart';

class UserService {
  static Future<List<UserModel>> search(String q) async {
    final res = await HttpService.get('${Api.search}?q=$q');
    final List data = jsonDecode(res.body);
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  static Future<UserModel> me() async {
    final res = await HttpService.get(Api.me);
    final data = jsonDecode(res.body);
    return UserModel.fromJson(data);
  }
}
