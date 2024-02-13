import 'package:flutter/material.dart';

class historyPage extends StatefulWidget {
  const historyPage({super.key});

  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('히스토리'),
      ),
      body: Center(
        child: Column(children: [
          TextButton(onPressed: (){}, child: Text('불러')),
          TextButton(onPressed: (){}, child: Text('와야댐')),
          TextButton(onPressed: (){}, child: Text('이런식으로')),
        
          ]),
      ),
    );
  }
}
