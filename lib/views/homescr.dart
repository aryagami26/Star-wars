import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ninja/models/modelss.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  model stars = model();
  bool isloading = false;
  int currentpage = 1;
  int totalpages = 6;

  Future<void> apiget() async {
    setState(() {
      isloading = true;
    });

    http.Response request = await http.get(Uri.parse(
        'https://swapi.dev/api/planets/?page=$currentpage&format=json'));

    if (request.statusCode == 200) {
      stars = model.fromJson(jsonDecode(request.body));
      setState(() {
        isloading = false;
        currentpage = currentpage + 1;
      });
    } else {}
  }

  @override
  void initState() {
    apiget();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: Text(
          "Star Wars",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Stromtrooper Armor',
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 0.5
              ..color = Color.fromRGBO(235, 151, 26, 1),
            wordSpacing: 5,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: isloading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: stars.results?.length,
                itemBuilder: (context, index) {
                  Results sca = stars.results![index];
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.black,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(sca.name ?? "Planet Name",
                                          style: TextStyle(
                                            fontFamily: 'joystix',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            foreground: Paint()
                                              ..color = Color.fromARGB(
                                                  225, 255, 102, 0),
                                          )),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Rotation Period",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        foreground: Paint()
                                                          ..color =
                                                              Colors.white),
                                                  ),
                                                  Text(
                                                    "${sca.rotationPeriod ?? "NA"} Std. hrs",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Orbital Period",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        foreground: Paint()
                                                          ..color =
                                                              Colors.white),
                                                  ),
                                                  Text(
                                                    "${sca.orbitalPeriod ?? "NA"} Std. days",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        foreground: Paint()
                                                          ..color =
                                                              Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Diameter",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${sca.diameter ?? "NA"}km",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Climate",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    sca.climate ?? "NA",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Gravity",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..color = Colors.white,
                                              ),
                                            ),
                                            Text(
                                              sca.gravity ?? "NA",
                                              style: TextStyle(
                                                fontSize: 15,
                                                foreground: Paint()
                                                  ..color = Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Terrain",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    sca.terrain ?? "NA",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Surface Water",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${sca.surfaceWater ?? "NA"}%",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Population",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${sca.population ?? "NA"}",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      foreground: Paint()
                                                        ..color = Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "People",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        foreground: Paint()
                                                          ..color =
                                                              Colors.white),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Card(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(225, 255, 102, 0),
                          ),
                          child: Center(
                            child: Text(
                              sca.name ?? "PLanet Name",
                              style: TextStyle(
                                  fontFamily: 'joystix',
                                  fontSize: 20,
                                  foreground: Paint()
                                    ..style = PaintingStyle.fill
                                    ..color = const Color.fromARGB(
                                        255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(225, 255, 102, 0),
        onPressed: apiget,
        child: const Icon(
          Icons.arrow_forward,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
