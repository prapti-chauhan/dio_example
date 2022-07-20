import 'package:dio/dio.dart';
import 'package:dio_example/model.dart';
import 'package:flutter/material.dart';

  Future<List<Todos>> fetch() async {
    final response =
    await Dio().get("https://jsonplaceholder.typicode.com/todos");
    if (response.statusCode == 200) {
      var getUserData = response.data as List;
      print(getUserData);
      var listUser = getUserData.map((i) => Todos.fromJson(i)).toList();
       var list = listUser.map((e) => e.completed).toList();
       print(list);
      print(listUser);
      return  listUser;
    } else {
      throw Exception('Failed to load');
    }
  }
