import 'package:fp2/MODULES/myComponents.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          myAppBar(),
          SizedBox(height: 40),
          bodyTitle(),

          //!
          myBody6(),
          myBody6(),
          myBody6(),

          //!
          myBody8(),
          myBody7(),
          myBody6(),
          myBody6(),
          myBody5(),
          myBody5(),
          myBody4(),
          myBody4(),
          myBody3(),
          myBody3(),
          myBody2(),
          myBody2(),
          myBody(),
          myBody(),
        ]),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  myAppBar() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Trends',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Icon(Icons.search)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello, welcome to current trends',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // SizedBox(width: 20,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bodyTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'Recent friends activities :',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  myBody() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      height: MyComponents.screenSize(context).height * 0.7,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Column(children: [
                  //!profile
                  Container(
                      // width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kevin',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'bio',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                      )),

                  //! image

                  SizedBox(
                    height: MyComponents.screenSize(context).height * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg',
                      ),
                    ),
                  ),
                ]),
              ))),
    );
  }

  myBody2() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      height: MyComponents.screenSize(context).height * 0.59,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //!profile
                      Container(
                          // width: 140,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kevin',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'bio',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ])),

                      SizedBox(height: 15),

                      //! image
                      MyCard(),
                      SizedBox(height: 20),

                      //! image details
                      Text(
                        'John Wick: Chapter 4',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Movie',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.',
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 20),

                      //! Watched on :
                      Text(
                        'watched on 12 March 2023',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ))),
    );
  }

  myBody3() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      height: MyComponents.screenSize(context).height * 0.54,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //!profile
                      Container(
                          // width: 140,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kevin',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'bio',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ])),

                      SizedBox(height: 15),

                      //! image
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MyComponents.screenSize(context).height * 0.3,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                  // Colors.black,
                                  // Colors.transparent
                                  // Colors.black,
                                  // Colors.black54,
                                ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Stack(
                              // alignment: Alignment.centerRight,
                              children: [
                                Opacity(
                                  opacity:
                                      0.3, // Adjust the opacity value as needed
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      width: MediaQuery.of(context).size.width,
                                      'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                      // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your background image URL

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                          // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your foreground image URL
                                          // width: MediaQuery.of(context).size.width / 4,
                                          // height:
                                          //     MyComponents.screenSize(context)
                                          //             .height *
                                          //         0.3,

                                          fit: BoxFit.contain,
                                        ),
                                      )),

                                      //! image details

                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            // color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'John Wick: Chapter 4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                Text(
                                                  'Movie',
                                                  style: TextStyle(
                                                    // color: Colors.grey[600],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                // SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      //! Watched on :
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Kevin watched this on 12 March 2023',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ]),
              ))),
    );
  }

  myBody4() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      height: MyComponents.screenSize(context).height * 0.55,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! image
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MyComponents.screenSize(context).height * 0.3,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                  // Colors.black,
                                  // Colors.transparent
                                  // Colors.black,
                                  // Colors.black54,
                                ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Stack(
                              // alignment: Alignment.centerRight,
                              children: [
                                Opacity(
                                  opacity:
                                      0.3, // Adjust the opacity value as needed
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      width: MediaQuery.of(context).size.width,
                                      'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                      // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your background image URL

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                          // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your foreground image URL
                                          // width: MediaQuery.of(context).size.width / 4,
                                          // height:
                                          //     MyComponents.screenSize(context)
                                          //             .height *
                                          //         0.3,

                                          fit: BoxFit.contain,
                                        ),
                                      )),

                                      //! image details

                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            // color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'John Wick: Chapter 4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                Text(
                                                  'Movie',
                                                  style: TextStyle(
                                                    // color: Colors.grey[600],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                // SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      //!profile
                      Container(
                          // width: 140,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kevin',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'bio',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ])),

                      SizedBox(height: 20),
                      //! Watched on :
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Kevin watched this on 12 March 2023',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ]),
              ))),
    );
  }

  myBody5() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      height: MyComponents.screenSize(context).height * 0.56,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //!profile
                      Container(
                          // width: 140,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kevin',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'bio',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ])),
                      SizedBox(height: 15),
                      //! image
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MyComponents.screenSize(context).height * 0.3,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                  // Colors.black,
                                  // Colors.transparent
                                  // Colors.black,
                                  // Colors.black54,
                                ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Stack(
                              // alignment: Alignment.centerRight,
                              children: [
                                Opacity(
                                  opacity:
                                      0.3, // Adjust the opacity value as needed
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      width: MediaQuery.of(context).size.width,
                                      'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                      // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your background image URL

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                          // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your foreground image URL
                                          // width: MediaQuery.of(context).size.width / 4,
                                          // height:
                                          //     MyComponents.screenSize(context)
                                          //             .height *
                                          //         0.3,

                                          fit: BoxFit.contain,
                                        ),
                                      )),

                                      //! image details

                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            // color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'John Wick: Chapter 4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                Text(
                                                  'Movie',
                                                  style: TextStyle(
                                                    // color: Colors.grey[600],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                // SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      // Divider(height: 20),

                      //! Watched on :
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 8),

                            Text(
                              'Kevin watched this on:',
                              style: TextStyle(
                                color: Colors.grey[500],
                                // fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '12 March 2023',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // SizedBox(height: 10),
                      Divider(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ]),
              ))),
    );
  }

  myBody6() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      height: MyComponents.screenSize(context).height * 0.555,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //!profile
                      Container(
                          // width: 140,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kevin',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'bio',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ])),
                      SizedBox(height: 20),
                      //! image
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MyComponents.screenSize(context).height * 0.3,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                  // Colors.black,
                                  // Colors.transparent
                                  // Colors.black,
                                  // Colors.black54,
                                ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Stack(
                              // alignment: Alignment.centerRight,
                              children: [
                                Opacity(
                                  opacity:
                                      0.3, // Adjust the opacity value as needed
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      width: MediaQuery.of(context).size.width,
                                      'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                      // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your background image URL

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                          // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your foreground image URL
                                          // width: MediaQuery.of(context).size.width / 4,
                                          height:
                                              MyComponents.screenSize(context)
                                                  .height,

                                          fit: BoxFit.cover,
                                        ),
                                      )),

                                      //! image details

                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            // color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Kevin watched on 12 March 2023 and says, ',
                                                  style: TextStyle(
                                                    // color: Colors.grey[600],
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  '"' +
                                                      'The set as well the action in this movie is great, looking forward to a sequel' +
                                                      '"',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                  ),
                                                ),

                                                // SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      //! image details
                      Text(
                        'John Wick: Chapter 4',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        'Movie',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 12),
                      // Divider(),
                      // SizedBox(height: 1),

                      //! created on :
                      Text(
                        'Post created by kevin on 09 May 2023',
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                      // Text(
                      //   'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.',
                      //   overflow: TextOverflow.clip,
                      //   maxLines: 2,
                      //   style: TextStyle(
                      //     color: Colors.grey[500],
                      //     fontWeight: FontWeight.normal,
                      //     fontSize: 10,
                      //   ),
                      // ),
                      // SizedBox(height: 20),

                      // //! created on :
                      // Text(
                      //   'Post created on 12 March 2023',
                      //   style: TextStyle(
                      //       color: Colors.grey[500],
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ]),
              ))),
    );
  }

  myBody7() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      height: MyComponents.screenSize(context).height * 0.545,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! image
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MyComponents.screenSize(context).height * 0.3,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                  // Colors.black,
                                  // Colors.transparent
                                  // Colors.black,
                                  // Colors.black54,
                                ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Stack(
                              // alignment: Alignment.centerRight,
                              children: [
                                Opacity(
                                  opacity:
                                      0.3, // Adjust the opacity value as needed
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      width: MediaQuery.of(context).size.width,
                                      'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                      // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your background image URL

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                          // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your foreground image URL
                                          // width: MediaQuery.of(context).size.width / 4,
                                          // height:
                                          //     MyComponents.screenSize(context)
                                          //             .height *
                                          //         0.3,

                                          fit: BoxFit.contain,
                                        ),
                                      )),

                                      //! image details

                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            // color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Kevin watched on 12 March 2023 and says, ',
                                                  style: TextStyle(
                                                    // color: Colors.grey[600],
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  '"' +
                                                      'The set as well the action in this movie is great, looking forward to a sequel' +
                                                      '"',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),

                                                // SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      //! image details
                      Text(
                        'John Wick: Chapter 4',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        'Movie',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      // SizedBox(height: 10),
                      Divider(height: 20),
                      // Divider(),
                      // SizedBox(height: 1),
                      //!profile
                      Container(
                          // width: 140,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kevin',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'bio',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ])),
                      SizedBox(height: 5),

                      //! created on :
                      Text(
                        'Post created by kevin on 09 May 2023',
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                      // Text(
                      //   'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.',
                      //   overflow: TextOverflow.clip,
                      //   maxLines: 2,
                      //   style: TextStyle(
                      //     color: Colors.grey[500],
                      //     fontWeight: FontWeight.normal,
                      //     fontSize: 10,
                      //   ),
                      // ),
                      // SizedBox(height: 20),

                      // //! created on :
                      // Text(
                      //   'Post created on 12 March 2023',
                      //   style: TextStyle(
                      //       color: Colors.grey[500],
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ]),
              ))),
    );
  }

  myBody8() {
    return SizedBox(
      width: MyComponents.screenSize(context).width,
      height: MyComponents.screenSize(context).height * 0.53,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Divider(),
                      // SizedBox(height: 1),
                      //!profile
                      Container(
                          // width: 140,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white
                          ),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kevin',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'bio',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                                //! created on :
                                Text(
                                  'Post created by kevin on 09 May 2023',
                                  overflow: TextOverflow.clip,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ])),
                      SizedBox(height: 5),

                      SizedBox(height: 10),

                      //! image
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                MyComponents.screenSize(context).height * 0.3,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                  // Colors.black,
                                  // Colors.transparent
                                  // Colors.black,
                                  // Colors.black54,
                                ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Stack(
                              // alignment: Alignment.centerRight,
                              children: [
                                Opacity(
                                  opacity:
                                      0.3, // Adjust the opacity value as needed
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      width: MediaQuery.of(context).size.width,
                                      'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                      // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your background image URL

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          'https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/suzume-et00352085-1675854007.jpg',

                                          // 'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your foreground image URL
                                          // width: MediaQuery.of(context).size.width / 4,
                                          // height:
                                          //     MyComponents.screenSize(context)
                                          //             .height *
                                          //         0.3,

                                          fit: BoxFit.contain,
                                        ),
                                      )),

                                      //! image details

                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            // color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Kevin watched on 12 March 2023 and says, ',
                                                  style: TextStyle(
                                                    // color: Colors.grey[600],
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  '"' +
                                                      'The set as well the action in this movie is great, looking forward to a sequel' +
                                                      '"',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),

                                                // SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      //! image details
                      Text(
                        'John Wick: Chapter 4',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        'Movie',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      // SizedBox(height: 10),
                      // Text(
                      //   'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.',
                      //   overflow: TextOverflow.clip,
                      //   maxLines: 2,
                      //   style: TextStyle(
                      //     color: Colors.grey[500],
                      //     fontWeight: FontWeight.normal,
                      //     fontSize: 10,
                      //   ),
                      // ),
                      // SizedBox(height: 20),

                      // //! created on :
                      // Text(
                      //   'Post created on 12 March 2023',
                      //   style: TextStyle(
                      //       color: Colors.grey[500],
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ]),
              ))),
    );
  }

  myOldBody() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(24),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 260,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Wick: Chapter 4',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Movie',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table.',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            width: 140,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kevin',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'bio',
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            )),
                        Text(
                          'watched on 12 March 2023',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: Container(
          // width: double.infinity,
          // color: Colors.grey, // Change to your desired background color
          child: Stack(
            // alignment: Alignment.centerRight,
            children: [
              Opacity(
                opacity: 0.2, // Adjust the opacity value as needed
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your background image URL
                    width: MediaQuery.of(context).size.width,
                    height: MyComponents.screenSize(context).height * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://www.themoviedb.org/t/p/original/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg', // Replace with your foreground image URL
                  // width: MediaQuery.of(context).size.width / 4,
                  height: MyComponents.screenSize(context).height * 0.3,

                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
