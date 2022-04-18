import 'package:dio/dio.dart';
import 'package:bloc_one_o_one/home/model/bored_api_model.dart';

class BoredService {
  Future<BoredApiModel> getBoredActivity() async {
    final res = await Dio().get('https://www.boredapi.com/api/activity');
    // print('res.data ${res.data["accessibility"].runtimeType}');
    final BoredApiModel activity = boredApiModelFromJson(res.data);
    return activity;
  }
}