import 'package:flutter/material.dart';
import '../constraints/colors.dart';
import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  
  final onToDOChanged;
  final onDeleteItem;

  const ToDoItem({super.key, required this.todo, required this.onToDOChanged, required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //print('Clicked on Todo Item');
          onToDOChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box: Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!, 
          style: TextStyle(
            fontSize: 16,
            color: tdBlack, 
            decoration: todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              //print('Clicked on Delete icon');
              onDeleteItem(todo.id);
            },
          ),
        ),
      )
    );
  }
}