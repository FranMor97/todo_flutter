import 'package:flutter/material.dart';
import 'package:to_do/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //get user info
          TextField(
            controller: controller,
            decoration:
                const InputDecoration(border: OutlineInputBorder(), hintText: "Add a new Pokemon"),
          ),
          //buttons => save adn cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save buttom
              MyButton(text: "Save", onPressed: onSave),

              const SizedBox(width: 8),

              //cancel button
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          )
        ]),
      ),
    );
  }
}
