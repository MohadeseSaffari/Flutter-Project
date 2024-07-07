import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_page/todo.dart';
import 'package:flutter_application_1/todo_page/todo_controller.dart';
import 'package:flutter_application_1/userPerfrences/current_user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTodoPage extends StatefulWidget {
  @override
  _MyTodoPageState createState() => _MyTodoPageState();
}

class _MyTodoPageState extends State<MyTodoPage> {
  final CurrentUser _currentUser = Get.put(CurrentUser());
  List<dynamic> todos = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final todoController = Get.put(TodoController()); 

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("SHINE"),Text("TODO",style: TextStyle(color: Color.fromARGB(255, 19, 12, 158),fontWeight: FontWeight.bold),),],
      ),
      centerTitle: true,
      elevation: 0.0,
      actions: [IconButton(onPressed: (){
        showDialog(context: context, builder: (context)=>Dialog(child: ManipulateTodo(),));
      }, icon: Icon(Icons.add_circle_outline,color: Color.fromARGB(255, 19, 12, 158),))],
      ),
      body: Padding(padding: const EdgeInsets.all(10),
      child: GetBuilder<TodoController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: controller.todos.map((todo) => Slidable(
                    child: TodoTile(
                      todo:todo
                    ),
                    endActionPane: ActionPane(motion: const ScrollMotion(),children: [
                      SlidableAction(onPressed: (context){},
                      backgroundColor: const Color.fromARGB(255, 110, 39, 176),
                      foregroundColor: Colors.white,
                      icon: Icons.mode_edit_outlined,
                      label: "Edit",),
          
                      SlidableAction(onPressed: (context){},
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.restore_from_trash_outlined,
                      label: "Delete",)
                    ]),
                    )).toList(),
                ),
              ))
            ],
          );
        }
      ),),
   );
  }
}

class TodoTile extends StatelessWidget {
  const TodoTile({Key? key,required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 3),
            blurRadius: 12
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todo.title!,style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.w600),),
          Text(todo.date!,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400),),
          Text(todo.description!,style: TextStyle(fontSize: 16,color: Colors.black54
          ),)
        ],
      ),
    );
  }
}

class ManipulateTodo extends StatelessWidget {
  const ManipulateTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<TodoController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text("Add Todo",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.w600),),
               const SizedBox(height: 30,),
               CustomTextField(hint: "Title",controller: controller.titleController,),
               const SizedBox(height: 10,),
               CustomTextField(hint: "Description",maxLines: 5,controller: controller.descriptionController,),
               SizedBox(height: 30,),
               CusstomButton(label:"Add",onPressed:()async{
                await Get.showOverlay(asyncFunction: ()=>controller.addTodo());
               }),
            ],
          );
        }
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.hint,this.obscureText = false,this.controller,this.keyboardType = TextInputType.text,this.maxLines = 1});

  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 3),
            blurRadius: 12
          )
        ]
      ),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.green
          ),
        ),
      ),
    );
  }
}

class CusstomButton extends StatelessWidget {
  const CusstomButton({Key? key,required this.label,required this.onPressed});

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(14),
           boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 3),
              blurRadius: 12
            )
           ],
        ),
        child: Text(
          label,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),
        ),
      ),
    );}
}