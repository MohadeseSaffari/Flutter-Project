import 'package:get/get.dart';
import 'package:flutter/material.dart';

customSnackbar(title,message,type){
  Get.snackbar(title, message,snackPosition: SnackPosition.TOP,
  backgroundColor: type == "error" ? Colors.red : Colors.green,
  colorText: Colors.white);
}