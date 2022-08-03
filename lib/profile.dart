import 'package:flutter/material.dart';

class WorkoutProfile extends StatefulWidget {
  const WorkoutProfile({Key? key}) : super(key: key);

  @override
  State<WorkoutProfile> createState() => _WorkoutProfileState();
}

class _WorkoutProfileState extends State<WorkoutProfile> {
  // controllers
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  // weight data
  bool isInKilogram = false;
  double _weight = 60.00; // -> this one changing the weight
  double _tempWeight =
      60.00; // -> I need this temporary weight to recover old weight when i convert lb back to kg.

  // height data
  bool isInCentimeter = false;
  double _height = 170.00;
  double _tempHeight = 170.00;

  // slider
  double _selectedValue = 50.0;

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
            profileAppBar(),
            const Text(
              "Health Data",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Container(
              height: 140,
              // color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  weightData(),
                  heightData(),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Set Goal",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "weight : ${_selectedValue.round()}",
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SliderTheme(
                  data: SliderThemeData(
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(
                    max: 100,
                    min: 0,
                    activeColor: const Color.fromARGB(255, 1, 250, 225),
                    inactiveColor: const Color.fromARGB(255, 22, 22, 22),
                    value: _selectedValue,
                    onChanged: (double value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 22, 22, 22),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                cursorColor: Colors.grey,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: "explore coaches",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    )),
              ),
            ),
            Container(
              height: 220,
              // color: Colors.yellow,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        rotatedContainer(Icons.push_pin, "Mickey mouse"),
                        Container(
                          height: 180,
                          width: 168,
                          padding: const EdgeInsets.fromLTRB(18, 38, 18, 18),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 22, 22, 22),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Shaggy",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "connected",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                      backgroundColor:
                                          Colors.green.withOpacity(0.1),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "22 days left to expire your connection",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      Icons.push_pin,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      Icons.email,
                                      size: 16,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      Icons.phone,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        rotatedContainer(Icons.push_pin, "Alex the king"),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 15,
                    left: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      backgroundImage: AssetImage(
                        "assets/mickey_mouse.jpg",
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 15,
                    left: 90,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      backgroundImage: AssetImage(
                        "assets/shaggy.png",
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 15,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      backgroundImage: AssetImage(
                        "assets/alex.jpg",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rotatedContainer(IconData icon, String text) => RotatedBox(
        quarterTurns: 3,
        child: Container(
          height: 65,
          width: 180,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 22, 22, 22),
          ),
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: CircleAvatar(
                  radius: 20,
                  child: Icon(
                    icon,
                    size: 16,
                    color: Colors.amber,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
      );

  Widget heightData() => Container(
        height: 65,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 22, 22, 22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Height",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Row(
              children: [
                // Alert box popup when i click on editIcon and change height
                GestureDetector(
                  onTap: () {
                    showHeightAlertBox();
                  },
                  child: const Icon(
                    Icons.edit,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(_height.toString().substring(0, 3),
                    style: const TextStyle(
                      fontSize: 13,
                    )),
              ],
            ),
            Row(
              children: [
                const Text("cm",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
                Switch(
                  value: isInCentimeter,
                  onChanged: (value) {
                    setState(() {
                      isInCentimeter = !isInCentimeter;
                      // convert cm into ft if value is true
                      if (value) {
                        _height = _height * 0.0328; // formula
                      } else {
                        _height = _tempHeight; // recover old height
                      }
                    });
                  },
                ),
                const Text("ft",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
              ],
            ),
          ],
        ),
      );

  void showHeightAlertBox() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 22, 22, 22),
            content: TextField(
              // need controller to grab text data
              controller: _heightController,
              decoration: const InputDecoration(
                hintText: "Height",
                hintStyle: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // when save grab text data from alert box and put back into height text
                  setState(() {
                    _height = double.parse(
                        _heightController.text); // string to double
                    _tempHeight = double.parse(_heightController.text);
                  });
                  Navigator.pop(context); // go back to old page
                },
                child: const Text(
                  "save",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget weightData() => Container(
        height: 65,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 22, 22, 22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Weight",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Row(
              children: [
                // Alert box popup when i click on editIcon and change weight
                GestureDetector(
                  onTap: () {
                    showWeightAlertBox();
                  },
                  child: const Icon(
                    Icons.edit,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("$_weight",
                    style: const TextStyle(
                      fontSize: 13,
                    )),
              ],
            ),
            Row(
              children: [
                const Text("kg",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
                Switch(
                  value: isInKilogram,
                  onChanged: (value) {
                    setState(() {
                      isInKilogram = !isInKilogram;
                      // convert kg into lb if value is true
                      if (value) {
                        _weight = _weight * 2.205; // formula
                      } else {
                        _weight = _tempWeight; // recover old weight
                      }
                    });
                  },
                ),
                const Text("lb",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
              ],
            ),
          ],
        ),
      );

  void showWeightAlertBox() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 22, 22, 22),
            content: TextField(
              // need controller to grab text data
              controller: _weightController,
              decoration: const InputDecoration(
                hintText: "Weight",
                hintStyle: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // when save grab text data from alert box and put back into weight text
                  setState(() {
                    _weight = double.parse(
                        _weightController.text); // string to double
                    _tempWeight = double.parse(_weightController.text);
                  });
                  Navigator.pop(context); // go back to old page
                },
                child: const Text(
                  "save",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget profileAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Hi, Ducky",
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
