import 'package:flutter/material.dart'; // 플러터 위젯 및 머티리얼 디자인을 위한 라이브러리를 가져옵니다.
import 'random_user_page.dart'; // 앞서 작성한 RandomUserPage를 가져옵니다.

// 앱의 메인 함수를 정의합니다.
void main() {
  runApp(MyApp());
}

// StatelessWidget을 생성합니다. 이 위젯은 앱의 루트 위젯입니다.
class MyApp extends StatelessWidget {
  // 화면에 표시할 위젯을 빌드합니다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Async Demo', // 앱의 제목을 설정합니다.
      theme: ThemeData(
        primarySwatch: Colors.blue, // 앱의 기본 색상 테마를 설정합니다.
      ),
      home: RandomUserPage(), // 앱의 시작 화면으로 RandomUserPage를 설정합니다.
    );
  }
}
