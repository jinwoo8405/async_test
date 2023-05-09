import 'dart:convert'; // JSON 데이터를 변환하기 위한 라이브러리를 가져옵니다.
import 'package:http/http.dart' as http; // HTTP 요청을 보내기 위한 라이브러리를 가져옵니다.

// 비동기 함수를 선언합니다. 외부 API에서 사용자 데이터를 가져오는 함수입니다.
Future<Map<String, dynamic>> fetchRandomUser() async {
  // Random ID를 사용하여 API 요청을 보냅니다.
  var randomId = 1 + (0 + new DateTime.now().millisecondsSinceEpoch) % 9;
  // API 요청을 보내고 응답을 기다립니다.
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$randomId'));

  // 응답 상태 코드가 200(성공)인 경우 JSON 데이터를 디코드하고 반환합니다.
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    // 그렇지 않은 경우 예외를 발생시킵니다.
    throw Exception('Failed to load user');
  }
}
