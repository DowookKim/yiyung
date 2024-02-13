import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:login/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class RandomRoomScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _roomCodeController = TextEditingController();

  final String userEmail;

  RandomRoomScreen({required this.userEmail});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Random Room'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String roomCode = generateRandomCode();
                    return AlertDialog(
                      title: Text('Generated Room Code'),
                      content: Text('Room Code: $roomCode'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: roomCode));//클립보드 복사
                            Navigator.of(context).pop();
                            createRoom(roomCode);
                            //joinRoom(roomCode);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Generate and Join Room'),
            ),
            SizedBox(height: 20),
            Text('Enter Room Code:'),
            SizedBox(height: 10),
            TextField(
              controller: _roomCodeController,
              decoration: InputDecoration(
                hintText: 'Room Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String roomCode = _roomCodeController.text;
                if (roomCode.isNotEmpty) {
                  joinRoom(roomCode);
                }
              },
              child: Text('Join Room'),
            ),
          ],
        ),
      ),
    );
  }

  String generateRandomCode() {
    Random random = Random();
    int randomNumber = random.nextInt(900000) + 100000;
    return randomNumber.toString();
  }

  void createRoom(String roomCode) {
    _firestore.collection('rooms').doc(roomCode).set({
      'createdAt': DateTime.now(),
      'users': [],
    });
  }

  void joinRoom(String roomCode) async {
    DocumentReference roomRef = _firestore.collection('rooms').doc(roomCode);
    DocumentSnapshot roomSnapshot = await roomRef.get();
    
   if (roomSnapshot.exists) {
  dynamic data = roomSnapshot.data();
  if (data != null && data.containsKey('users')) {
    List<dynamic> users = List.from(data['users']);
    users.add(userEmail); // 사용자 ID를 추가해야 합니다.
    roomRef.update({'users': users});
  }
}
  }
}
void main() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      runApp(MaterialApp(
        home: RandomRoomScreen(userEmail: user.email!),
      ));
    }
  });
}

