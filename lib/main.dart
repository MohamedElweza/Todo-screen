// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_7/todo.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    List<Todo> todos = [
    Todo("Communication Systems Quiz", "10:00AM"),
    Todo('OS Report', '11:00 AM'),
    Todo('Buy some Stuff',  '1:00 PM'),
    Todo('Go to the Gym',  '2:00 PM'),
    Todo('Flutter Task',  '4:00 PM'),
    Todo('Flutter Task بردوا',  '6:00 PM'),

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: const Color(0xff4368FF),
        appBar: AppBar(
          centerTitle: true ,
          title: const Text(
            'Todo List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),
          backgroundColor: const Color(0xff4368FF),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder:  (context, index) {
            return Container(
              height: 60,
              color: const Color(0xff4368FF),
              child: 
              ListTile(
                title:  Text(
                  todos[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Myfont2',
                    fontSize: 20,
                  ) ,
                  ),
                subtitle: Text(
                todos[index].time,
                style: 
                const TextStyle(
                    fontFamily: 'Myfont',
                    fontSize: 15,
                  ),
                ),
                trailing: IconButton( 
                  icon: const Icon(Icons.delete),
                  onPressed: () { 
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text('Delete') ,
                          content: const Text('Are you sure you want to delete this item ?') ,
                          actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel")),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          todos.removeAt(index);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Yes"))
                               
                          ],
                        );
                      });
                   }, ),
                textColor: Colors.white,
                iconColor: Colors.white, 
              ),
            );
          },),
        ),
      );
    
  }
}