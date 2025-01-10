import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3;
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  addOne() {
    setState(() {
      total++;
    });
  }

  addName(a) {
    setState(() {
      name.add(a);
      like.add(0);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return DialogUI(
                    addOne: addOne,
                    addName: addName,
                  );
                });
          },
        );
      }),
      appBar: AppBar(
        title: Text(total.toString(), style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (c, i) {
          return ListTile(
            leading: Icon(
              Icons.account_circle,
              size: 40,
            ),
            title: Text(name[i] + like[i].toString()),
            trailing: TextButton(
                onPressed: () {
                  setState(() {
                    like[i]++;
                  });
                },
                child: Text('좋아요')),
          );
        },
      ),
      bottomNavigationBar: BottomDesign(),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.addOne, this.addName});
  final addOne;
  final addName;
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Text('연락처 추가창'),
          TextField(
            controller: inputData,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('취소')),
              TextButton(
                  onPressed: () {
                    addOne();
                    addName(inputData.text);
                    Navigator.pop(context);
                  },
                  child: Text('확인'))
            ],
          )
        ],
      ),
    );
  }
}

class BottomDesign extends StatelessWidget {
  const BottomDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.call),
          Icon(Icons.message),
          Icon(Icons.contact_page)
        ],
      ),
    );
  }
}
