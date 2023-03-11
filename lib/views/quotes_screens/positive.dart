import 'dart:math';

import 'package:db_miner_quotes_app/helper/db_quotes_helper.dart';
import 'package:db_miner_quotes_app/models/quotes_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';



class Positive_screen extends StatefulWidget {
  const Positive_screen({Key? key}) : super(key: key);

  @override
  State<Positive_screen> createState() => _Positive_screenState();
}

class _Positive_screenState extends State<Positive_screen> {

  late Future<List<QUOTES>> getAllQuotes;

  fetch() async {
    Future.delayed(
        const Duration(seconds: 10),
            () => setState(() {
          getAllQuotes = DBHelper.dbHelper.fetchAllQuotes4();
        }));
  }

  forGetVariable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? ispositionalArrived = prefs.getBool('positionalArrived') ?? false;

    (ispositionalArrived == false)
        ? DBHelper.dbHelper.JsonData4()
        : getAllQuotes = DBHelper.dbHelper.fetchAllQuotes4();
  }

  @override
  void initState() {
    super.initState();
    forGetVariable();
    getAllQuotes = DBHelper.dbHelper.fetchAllQuotes4();

    fetch();
  }

  List<String> RandomImage = [
    "assets/images/r1.jpg",
    "assets/images/r2.jpg",
    "assets/images/r3.jpeg",
    "assets/images/r4.jpg",
    "assets/images/r5.jpg",
    "assets/images/r6.jpg",
  ];
  late Random rnd;

  @override
  Widget build(BuildContext context) {

    int min = 0;
    int max = RandomImage.length - 1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    // String image_name = RandomImage[r].toString();

    Map images = {
      'diff' : RandomImage[r].toString(),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Positive Quotes",style: TextStyle(color: Colors.white,fontSize: 22),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
          future: getAllQuotes,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.hasError}"),
              );
            } else if (snapshot.hasData) {
              List<QUOTES> data = snapshot.data as List<QUOTES>;

              return (data != null)
                  ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, right: 15),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 330,
                            width: double.infinity,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  image: DecorationImage(
                                      image: AssetImage(images['diff']),
                                      fit: BoxFit.fill),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      "${data[i].quote}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      "- ${data[i].name}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white ,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 4, right: 4),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.yellow[300],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {

                                      });
                                    },
                                    icon: const Icon(
                                      Icons.image_outlined,
                                      size: 30,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await Share.share("Quotes: ${data[i].quote}\n- ${data[i].name}");
                                    },
                                    icon: const Icon(
                                      Icons.share_outlined,
                                      size: 30,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.download_outlined,
                                      size: 30,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.star_outline,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
                  : Center(
                child: Text("No data found..."),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
  isDataArrived() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('patienceArrived', true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isDataArrived();
  }
}
