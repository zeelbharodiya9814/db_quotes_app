import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:db_miner_quotes_app/components/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpeg",
  ];

  int currentpage = 0;
  CarouselController carouselController = CarouselController();

  List BUTTONS = [
    {
      'icon': Icons.widgets_outlined,
      'color': Colors.purple[600],
      'name': "Categ",
    },
    {
      'icon': Icons.photo_outlined,
      'color': Colors.blueGrey,
      'name': "Pic",
    },
    {
      'icon': Icons.settings_outlined,
      'color': Colors.amber,
      'name': "Latest",
    },
    {
      'icon': Icons.menu_book_outlined,
      'color': Colors.green[600],
      'name': "Articles",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes App"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        actions: [
          SizedBox(width: 15),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.notification_add,color: Colors.yellow,)),
          IconButton(
              onPressed: () {
                showDialog<void>(
                  barrierDismissible: false,
                  context: (context),
                  builder: (BuildContext dialogContext) {
                    return Dialog(
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              '😀',
                              style: TextStyle(fontSize: 50),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text('Like our App?'),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: const Text(
                              textAlign: TextAlign.center,
                              "would you mind taking a moment to raye it and provide us your valuable reviews and suggestions.",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text("Thanks for your support!"),
                          const SizedBox(height: 30),
                          const Text(
                            "⭐ ⭐ ⭐ ⭐ ⭐",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(height: 50),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: ElevatedButton(
                              // style: ButtonStyle(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "                    Thanks for your support!                    "),
                                      backgroundColor: Colors.green,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );

                                  Navigator.of(dialogContext)
                                      .pop();
                                }, child: const Text("RATE US")),
                          ),
                          TextButton(
                            child: const Text('not now'),
                            onPressed: () {
                              Navigator.of(dialogContext)
                                  .pop(); // Dismiss alert dialog
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              )),

        ],
      ),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      autoPlay: true,
                      onPageChanged: (val, _) {
                        setState(() {
                          currentpage = val;
                        });
                        print(currentpage);
                      },
                      height: 200,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 0.95,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      ...images
                          .map(
                            (e) => Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 5,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 390,
                                    child: Image.asset(
                                      "${e}",
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 11,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...images.map(
                          (e) {
                            int i = images.indexOf(e);

                            return Padding(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              child: GestureDetector(
                                onTap: () {
                                  carouselController.animateToPage(i,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                  print(i);
                                },
                                child: CircleAvatar(
                                  radius: (currentpage == i) ? 6 : 4,
                                  backgroundColor: (currentpage == i)
                                      ? Colors.grey[400]
                                      : Colors.grey[800],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...BUTTONS
                    .map((e) => Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('random');
                      },
                      child: Icon(e["icon"],size: 30,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: e['color'],
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e['name'],style: TextStyle(fontSize: 13),),
                    ),
                  ],
                ))
                    .toList(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, left: 20),
                  child: Text(
                    "Most Popular",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                     Navigator.pushNamed(context, 'Motivation_screen');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 10, left: 12, right: 0,
                      ),
                      child: QuotesTypes(
                          image: "https://t3.ftcdn.net/jpg/05/41/37/46/360_F_541374608_CeW26MyZEm9zor9a3cVVaBq4sjsQhKcR.jpg",
                          name: " Motivation Quotes"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Positive_screen');
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 10, left: 10, right: 12,
                        ),
                        child: QuotesTypes(
                            image: "https://www.uspm.com/wp-content/uploads/2021/04/uspm_feature_stayingpositive.jpg",
                            name: " Positive Quotes")),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Love_screen');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 10, left: 12, right: 0,
                      ),
                      child: QuotesTypes(
                          image: "https://cdn.pixabay.com/photo/2015/03/30/20/33/heart-700141__340.jpg",
                          name: " Love Quotes"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Life_screen');
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 10, left: 10, right: 12,
                        ),
                        child: QuotesTypes(
                            image: "https://www.shutterstock.com/image-photo/beauty-girl-running-jumping-on-260nw-670248235.jpg",
                            name: " Life Quotes")),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, left: 20),
                  child: Text(
                    "Quotes by category",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Motivation_screen');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 10, left: 12, right: 0,
                      ),
                      child: QuotesTypes(
                          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwAMEmNPUQwfNEA36VrG_2kqJqzQc5ShMVg&usqp=CAU",
                          name: " Bravery Quotes"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Positive_screen');
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 10, left: 10, right: 12,
                        ),
                        child: QuotesTypes(
                            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN-8tAf6LfG6BQN0wQ1qby98vbRLD6mQkuXw&usqp=CAU",
                            name: " Confidence Quotes")),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Love_screen');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 10, left: 12, right: 0,
                      ),
                      child: QuotesTypes(
                          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkNd36mhPtezGg7Vko4v1IDz4foSU7HCOuzQ&usqp=CAU",
                          name: " Courage Quotes"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Life_screen');
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 10, left: 10, right: 12,
                        ),
                        child: QuotesTypes(
                            image: "https://t3.ftcdn.net/jpg/03/35/03/80/360_F_335038059_4l1yaUTuBEwj0qqz3J1ExrivLFceGqvA.jpg",
                            name: " Hope Quotes")),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 10, left: 10, right: 12),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(color: Colors.black, spreadRadius: 0.1, blurRadius: 0.5),
                ],
                image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-vector/nice-quote-green-background_1017-5133.jpg?size=338&ext=jpg&ga=GA1.2.869460900.1676737448&semt=ais"), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
  QuotesTypes({
    required String image,
    required String name,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.black, spreadRadius: 0.1, blurRadius: 0.5),
            ],
            image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(" ${name}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
