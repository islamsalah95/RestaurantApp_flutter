import 'package:flutter/material.dart';
import 'package:menue/constant/constant.dart';

class TopicList extends StatefulWidget {
  final String selectedtopic;
  final Function(String) onTopicSelected;

  TopicList({super.key, required this.selectedtopic, required this.onTopicSelected});

  @override
  State<TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  int? selected;
  late String currentSelectedTopic;

  List<String> topics = [
    'pizzaList',
    'burgerList',
    'pastaList',
    'soupList',
    'shawermaList',
    'grilledList',
  ];

  @override
  void initState() {
    super.initState();
    currentSelectedTopic = widget.selectedtopic;
    selected = topics.indexOf(widget.selectedtopic);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.initi(context);
    return SizedBox(
      height: ScreenSize.height / 8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentSelectedTopic = topics[index];
                  selected = index;
                  widget.onTopicSelected(currentSelectedTopic);
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenSize.width / 5,
                height: ScreenSize.height / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selected == index
                      ? const Color.fromARGB(255, 206, 198, 198)
                      : kprimaryColor,
                ),
                child: Center(
                  child: Text(
                    topics[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
