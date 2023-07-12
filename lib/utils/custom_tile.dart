import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomTile extends StatelessWidget {
  CustomTile({
    super.key,
    required this.title,
    required this.task,
    required this.onChangedFunction,
    required this.onDeleteFunction,
    this.startingTime = '0.00 PM',
    this.endingTime = '0.00 PM',
    this.isCompleted = false,
  });

  final String title;
  final String task;
  final String startingTime;
  final String endingTime;
  final bool isCompleted;
  final void Function(bool?)? onChangedFunction;
  void Function(BuildContext)? onDeleteFunction;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onDeleteFunction,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(8.0),
            backgroundColor: Colors.red.shade400,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0, right: 15.0, left: 15.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      value: isCompleted,
                      onChanged: onChangedFunction,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
              Text(
                task,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              Divider(
                height: 24,
                color: Colors.grey[300],
                thickness: 1.0,
              ),

              // time of added and time for which it should be completed
              Padding(
                padding: const EdgeInsets.only(bottom: 14, top: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      "$startingTime - $endingTime",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
