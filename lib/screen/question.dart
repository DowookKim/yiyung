import 'package:flutter/material.dart';
import 'package:login/screen/history.dart';

class questionPage extends StatefulWidget {
  const questionPage({super.key});

  @override
  State<questionPage> createState() => _questionPageState();
}

class _questionPageState extends State<questionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFCF6),
      appBar: AppBar(
        title: Text('오늘의 질문'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const historyPage()));
              },
              child: Text('히스토리')),
          Text('질문 업데이트'),
          Column(children: [
            Container(
              height: 400,
              child: ListView(
                children: const <Widget>[
                  Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(16, 11.5, 0, 13.5),
                      leading: Column(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 53,
                          ),
                          Text('닉네임')
                        ],
                      ),
                      title: TextField(),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Text('수정불가 안내문'),
          TextButton(onPressed: () {}, child: Text('답변 등록하기')),
        ],
      ),
    );
  }
}
