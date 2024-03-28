import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    // http에 커서를 가져다 대면 받는 데이터 타입이 Future<Response>로 설정되어 있음.
    // Future? : 미래에 받을 결과 값의 타입을 알려줌
    // 완료가 되었을 때 Response라는 타입을 반환할 것임을 명시함.
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
