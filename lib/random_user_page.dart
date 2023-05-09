import 'package:flutter/material.dart'; // 플러터 위젯 및 머티리얼 디자인을 위한 라이브러리를 가져옵니다.
import 'api.dart'; // 앞서 작성한 API 요청 함수를 가져옵니다.

// StatefulWidget을 생성합니다. 이 위젯은 앱의 메인 화면입니다.
class RandomUserPage extends StatefulWidget {
  @override
  _RandomUserPageState createState() => _RandomUserPageState();
}

// StatefulWidget에 대한 상태 클래스를 생성합니다.
class _RandomUserPageState extends State<RandomUserPage> {
  // 비동기로 데이터를 가져오는 Future 객체를 선언합니다.
  late Future<Map<String, dynamic>> futureUser;

  // initState 함수에서 비동기 함수를 호출하여 futureUser를 초기화합니다.
  @override
  void initState() {
    super.initState();
    _fetchNewUser();
  }
  // 새로운 사용자 정보를 불러오는 메서드입니다.
  void _fetchNewUser() {
    setState(() {
      futureUser = fetchRandomUser();
    });
  }
  // 화면에 표시할 위젯을 빌드합니다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User'), // 앱 바에 표시되는 제목을 설정합니다.
      ),
      body: Center(
        // FutureBuilder를 사용하여 비동기 데이터를 기다리며 위젯을 빌드합니다.
        child: FutureBuilder<Map<String, dynamic>>(
          future: futureUser,
          builder: (context, snapshot) {
            // 데이터를 기다리는 동안 CircularProgressIndicator를 표시합니다.
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // 에러가 발생한 경우 에러 메시지를 표시합니다.
              return Text('Error: ${snapshot.error}');
            } else {
              // 데이터가 로드되면 사용자 정보를 화면에 표시합니다.
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // 기존 코드
                  // Text('Name: ${snapshot.data['name']}'),
                  // Text('Email: ${snapshot.data['email']}'),
                  // Text('Phone: ${snapshot.data['phone']}'),

                  // 수정된 코드
                  Text('Name: ${snapshot.data?['name'] ?? 'Unknown'}'),
                  Text('Email: ${snapshot.data?['email'] ?? 'Unknown'}'),
                  Text('Phone: ${snapshot.data?['phone'] ?? 'Unknown'}'),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchNewUser, // 플로팅 액션 버튼을 클릭하면 새로운 사용자 정보를 불러옵니다.
        tooltip: 'Fetch New User',
        child: Icon(Icons.refresh), // 플로팅 액션 버튼에 새로 고침 아이콘을 사용합니다.
      ),
    );
  }
}
