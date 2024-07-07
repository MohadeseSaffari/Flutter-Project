import 'dart:convert';
import 'package:http/http.dart' as http;

class api{
  static const hostConnect = "http://192.168.201.48/api_clothes_store";
  static const hostConnectUser = "$hostConnect/user";

  //singup user
  static const SignUp = "$hostConnect/user/signup.php";
  static const Login = "$hostConnect/user/login.php";

  //todo
  static const get_tasks= "$hostConnect/todo/get_tasks.php";
  static const add_task = "$hostConnect/todo/add_task.php";
  static const update_task = "$hostConnect/todo/update_task.php";
  static const delete_task = "$hostConnect/todo/delete_task.php";

  //classes
  static const Classes = "$hostConnect/classes/get_classes.php";
  static const AddStudent = "$hostConnect/classes/add_student_to_class.php";

}