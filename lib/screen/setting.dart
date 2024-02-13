import 'package:flutter/material.dart';
import 'package:login/screen/mainscreen.dart';
import 'package:login/theme/color.dart';

class settingPage extends StatefulWidget {
  const settingPage({super.key});

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.chevron_left),
            ),
            Text('설정'),
          ],
        ),
        centerTitle: false,
        backgroundColor: AppColor.background,
      ),
      body: Container(
        color: AppColor.background,
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 34, left: 38),
                child: Text('우리 가족방 코드')),
            Column(
              children: [Padding(
                padding: const EdgeInsets.only(top: 27),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('코드자리          ')),
              ),
            
            Text('코드를 복사해 가족에게 공유하세요!'),]),
            Divider(),
            TextButton(
                child: Text('내 프로필 수정'),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 634,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text('개인 프로필 수정'),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            Text('프로필 사진'),
                            Text('닉네임'),
                            TextField(
                              maxLength: 10,
                            ),
                            Text('닉네임은 10자 이내로 입력 가능합니다'),
                            TextButton(
                              onPressed: () {},
                              child: Text('수정하기'),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
            Divider(),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 634,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text('가족 프로필 수정'),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            Text('배너에 등록할 사진을 첨부하세요'),
                            Text('가족방 이름 설정'),
                            TextField(
                              maxLength: 10,
                            ),
                            Text('가족방 이름은 10자 이내로 입력 가능합니다'),
                            TextButton(
                              onPressed: () {},
                              child: Text('수정하기'),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('가족 프로필 수정')),
            TextButton(
                onPressed: () {
                  onPressed:
                  () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              '로그아웃 하시겠습니까?',
                              style: TextStyle(fontSize: 16),
                            ),
                            backgroundColor: Colors.white,
                            shape: BeveledRectangleBorder(),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {},
                                child: const Text('예',
                                    style: TextStyle(fontSize: 14)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const settingPage()));
                                },
                                child: const Text('아니오',
                                    style: TextStyle(fontSize: 14)),
                              )
                            ],
                          ));
                },
                child: Text('로그아웃'))
          ],
        ),
      ),
    );
  }
}
