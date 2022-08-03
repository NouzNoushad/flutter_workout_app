import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutHome extends StatefulWidget {
  const WorkoutHome({Key? key}) : super(key: key);

  @override
  State<WorkoutHome> createState() => _WorkoutHomeState();
}

class _WorkoutHomeState extends State<WorkoutHome> {
  List<Map<String, dynamic>> warmupWorkouts = [
    {
      "text": "Jump Squat",
      "image": "jump_squat.png",
    },
    {
      "text": "Jumping",
      "image": "jumping.png",
    },
    {
      "text": "Running",
      "image": "running.png",
    },
  ];

  List<Map<String, dynamic>> trainingWorkouts = [
    {
      "text": "Sit-ups",
      "image": "sit_up.png",
    },
    {
      "text": "Lunch",
      "image": "lunch.png",
    },
    {
      "text": "Outward Push",
      "image": "push.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            workoutAppBar(),
            const Text(
              "Warmup",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Container(
              height: 228,
              // color: Colors.white,
              child: workoutListView(warmupWorkouts),
            ),
            const Text(
              "Training",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Container(
              height: 228,
              // color: Colors.white,
              child: workoutListView(trainingWorkouts),
            ),
          ],
        ),
      ),
    );
  }

  // take advantage of workoutlistView, i don't have to create another
  Widget workoutListView(List<Map<String, dynamic>> workouts) =>
      ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                extentRatio: 0.2,
                children: [
                  SlidableAction(
                      onPressed: (context) {
                        // remove list
                        setState(() {
                          workouts.removeAt(index);
                        });
                      },
                      icon: Icons.delete,
                      borderRadius: BorderRadius.circular(10)),
                ],
              ),
              child: workoutListTiles(workout),
            ), // Slidable package used to remove lists
          );
        },
      );

  Widget workoutListTiles(Map<String, dynamic> workout) => ListTile(
        tileColor: const Color.fromARGB(255, 22, 22, 22),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/${workout["image"]}"),
            ),
          ),
        ),
        title: Text(
          workout["text"],
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            letterSpacing: 0.8,
          ),
        ),
        trailing: RichText(
          text: const TextSpan(
            text: "20",
            style: TextStyle(
              fontSize: 17,
            ),
            children: [
              TextSpan(
                text: "min",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      );

  Widget workoutAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Your Workouts",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          CircleAvatar(
            // backgroundColor: Colors.white,
            radius: 18,
            backgroundImage: AssetImage(
              "assets/donald_duck.jpg",
            ),
          ),
        ],
      );
}
