import 'package:dio_example/model.dart';
import 'package:dio_example/repo.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Todos> _post = [];

  @override
  void initState() {
    super.initState();
    fetch().then((value) {
      _post = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dio Example'),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: _post.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text('userId: ${_post[index].userId}'),
                      Text('id: ${_post[index].id}'),
                      Text('title: ${_post[index].title}'),
                      Text(
                        '${_post[index].completed}',
                        style: TextStyle(
                            color: _post[index].completed
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
