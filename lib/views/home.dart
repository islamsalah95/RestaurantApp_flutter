import 'package:flutter/material.dart';
import 'package:menue/constant/constant.dart';
import 'package:menue/widges/TopicList.dart';
import 'package:menue/widges/menuList.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String selectedtopic = "pizzaList";
  TextEditingController name = TextEditingController(text: "Restaurant");

  void _onTopicSelected(String topic) {
    setState(() {
      selectedtopic = topic;
    });
  }

  void _editRestaurantName() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter your restaurant name"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context);
    return Scaffold(
      body: Container(
        width: ScreenSize.width,
        height: ScreenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/soup/Ar.jpg"),
            alignment: Alignment.topCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: ScreenSize.height / 2.5,
              child: CircleAvatar(
                radius: ScreenSize.width / 7,
                backgroundImage: const AssetImage("assets/logo.png"),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenSize.width,
                height: ScreenSize.height / 1.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenSize.height / 6,
                    ),
                    Row(
                      children: [
                        Text(
                          name.text,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: _editRestaurantName,
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                    TopicList(
                      selectedtopic: selectedtopic,
                      onTopicSelected: _onTopicSelected,
                    ),
                    Menulist(selectedtopic: selectedtopic),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
