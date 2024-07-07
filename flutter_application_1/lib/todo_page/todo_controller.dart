import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_connection/base_url.dart';
import 'package:flutter_application_1/api_connection/custom_snackbar.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/todo_page/todo.dart';
import 'package:flutter_application_1/userPerfrences/current_user.dart';
import 'package:flutter_application_1/userPerfrences/shared_prefs.dart';
import 'package:flutter_application_1/userPerfrences/user_perfrences.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController{
  List<Todo> todos = [];
  
  late TextEditingController  titleController,descriptionController;

  void onInit(){
    super.onInit();
    fetchMyTodos();

    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }
  void onClose(){
    super.onClose();
    titleController.dispose();
    descriptionController.dispose();
  }

  fetchMyTodos()async{
    var usr = await SharedPrefs().getUser();
    User user = User.fromJson(json.decode(usr));

    var response = await http.put(Uri.parse("http://192.168.201.48/api_clothes_store/todo/todos.php"),body: {
      'user_id':user.user_id
    });
    var res = await json.decode(response.body);
    if (res['success']) {
      todos = AllTodos.fromJson(res).todo!;
      update();
    }else{
      customSnackbar("Error", "Failed to fetch todos", "error");
    }
  }
  addTodo()async{
    var usr = await SharedPrefs().getUser();
    User user = User.fromJson(json.decode(usr));

    var response = await http.post(Uri.parse("http://192.168.201.48/api_clothes_store/todo/add_todo.php"),body: {
      'user_id':user.user_id,
      'title':titleController.text,
      'description':descriptionController.text
    });
    var res = await json.decode(response.body);
    if (res['success']) {
      customSnackbar("Succes", res['maessage'], "success");
      titleController.text = "";
      descriptionController.text = "";
      fetchMyTodos();
    }else{
      customSnackbar("Error", "Failed to fetch todos", "error");
    }
    update();
  }
}