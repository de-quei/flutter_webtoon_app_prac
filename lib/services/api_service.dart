import 'dart:convert';

import 'package:flutter_webtoon_app_prac/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    // http에 커서를 가져다 대면 받는 데이터 타입이 Future<Response>로 설정되어 있음.
    // Future? : 미래에 받을 결과 값의 타입을 알려줌
    // 완료가 되었을 때 Response라는 타입을 반환할 것임을 명시함.
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // Api 요소는 여러 오브젝트가 들어있는 List 형식임
      // 응답받은 결과를 Json타입으로 List에 담아 한 오브젝트 단위로 출력하는 과정 수행
      final List<dynamic> webtoons =
          jsonDecode(response.body); // dynamic 타입? : 어떤 타입이든 효용 가능
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromjson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
