import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> items = [];
  TextEditingController name = TextEditingController();
  TextEditingController editname = TextEditingController();

  addvalue() {
    setState(() {
      items.add(name.text);
      name.clear();
    });
  }

  delValue(index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo App'),
      ),
      body: Column(
        children: [
          TextField(
            controller: name,
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                addvalue();
              },
              child: Text('Add Text')),
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 5),
                      child: ListTile(
                          tileColor: Colors.grey,
                          title: Text(items[index]),
                          trailing: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: (() {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Edit Text'),
                                              content: TextField(
                                                controller: editname,
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      setState(() {
                                                        items.replaceRange(
                                                            index,
                                                            index + 1,
                                                            {editname.text});
                                                      });
                                                    },
                                                    child: Text('Edit')),
                                              ],
                                            );
                                          });
                                    }),
                                    icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      delValue(index);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}
