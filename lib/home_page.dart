import 'package:flutter/material.dart';
import 'package:todo/utils/add_task.dart';
import 'package:todo/utils/custom_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  String currentDate = "";
  List<String> dateList = [];
  String month = "";
  String day = "";

  // convert to month text
  void monthTextConversion(int value) {
    switch (value) {
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'June';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
    }
  }

  // convert to day text
  void dayTextConversion(int value) {
    switch (value) {
      case 1:
        day = 'Monday';
        break;
      case 2:
        day = 'Tuesday';
        break;
      case 3:
        day = 'Wednesday';
        break;
      case 4:
        day = 'Thursday';
        break;
      case 5:
        day = 'Friday';
        break;
      case 6:
        day = 'Saturday';
        break;
      case 7:
        day = 'Sunday';
        break;
    }
  }

  // getting current date
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    currentDate = date.toString().replaceAll("00:00:00.000", "");
    dateList = currentDate.split('-');
    monthTextConversion(int.parse(dateList[1]));
    dayTextConversion(date.weekday);
  }

  // list of all todo's
  List toDoList = [
    // heading, todo, startingtime, endingtime, check
    ['Yogas', 'Start your day with meditation.', '6.00 AM', '7.00 AM', false],
  ];

  // text editing controllers
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  final t3 = TextEditingController();
  final t4 = TextEditingController();

  // change check box status
  void changeStatus(bool? value, int index) {
    setState(() {
      toDoList[index][4] = !toDoList[index][4];
    });
  }

  // create task method
  void createTask() {
    setState(() {
      toDoList.add([t1.text, t2.text, t3.text, t4.text, false]);
      t1.clear();
      t2.clear();
      t3.clear();
      t4.clear();
    });
    Navigator.pop(context);
  }

  // delete task method
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // show dialog box to add a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return TaskBox(
            c1: t1,
            c2: t2,
            c3: t3,
            c4: t4,
            callBackAction: createTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[300],
        title: const Text("ACTIVITIES",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 2,
            )),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(children: [
        // title and add a new task button and others
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // tab name and date, day
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Task",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "$day, ${dateList[2]}$month",
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),

              // add a new task button
              TextButton(
                onPressed: createNewTask,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Icon(Icons.add, color: Colors.blue[800]),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "New Task",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // list tiles of todo's
        Expanded(
          child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
                  child: CustomTile(
                    title: toDoList[index][0],
                    task: toDoList[index][1],
                    startingTime: toDoList[index][2],
                    endingTime: toDoList[index][3],
                    isCompleted: toDoList[index][4],
                    onChangedFunction: (value) => changeStatus(value, index),
                    onDeleteFunction: (context) => deleteTask(index),
                  ),
                );
              })),
        )
      ]),
    );
  }
}
