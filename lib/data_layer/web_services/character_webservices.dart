import 'package:breaking_bad_app/constants/strings.dart';
import 'package:breaking_bad_app/data_layer/model/characters.dart';
import 'package:dio/dio.dart';


class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<Characters> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return Characters.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      throw Exception('errorrr no data is returned');
    }
  }
}
