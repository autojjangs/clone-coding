import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search),
                  Icon(Icons.menu),
                  Icon(Icons.notifications_none_outlined),
                ],
              ),
            )
          ],
          leading: Icon(Icons.arrow_drop_down),
          title: Text('금호동3가'),
        ),
        body: Container(
          width: double.infinity,
          height: 150,
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('ford.jpg'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ford Mustang',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '성동구 행당동 · 끌올 10분 전',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Text(
                    '1억 5000만 원',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 300,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.favorite_border), Text('4')],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
