import 'package:flutter/material.dart';

class CurdView extends StatelessWidget {
  const CurdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Field 1',
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Field 2',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your submit logic here
                        },
                        child: Text("Submit"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [

          
        ],
      ),
    );
  }
}
