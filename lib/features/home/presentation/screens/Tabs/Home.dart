import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              // Navbar container
              Container(
                //color: Colors.black45,

                height: 40.0,
                child: Row(
                  children: [
                    Icon(
                      Icons.insights_rounded,
                      color: Colors.red[700],
                      size: 40.0,
                    ),
                    Text(
                      'insayt',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.redAccent[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Welcome Back!',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[200]),
                          ),
                        ),
                        Text(
                          'Learn today!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.red[300]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                    child: Text(
                      "Category",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent.shade400),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black87,
                      ),
                      width: 150.0,
                      height: 150.0,
                      child: Column(
                        children: [
                          Image.asset('images/math.png'),
                          Text(
                            "Maths",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black87,
                      ),
                      width: 150.0,
                      height: 150.0,
                      child: Column(
                        children: [
                          Image.asset('images/math.png'),
                          Text(
                            "English Grammar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black87,
                      ),
                      width: 150.0,
                      height: 150.0,
                      child: Column(
                        children: [
                          Image.asset('images/biology.png'),
                          Text(
                            "Biology",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black87,
                      ),
                      width: 150.0,
                      height: 150.0,
                      child: Column(
                        children: [
                          Image.asset('images/cloud-network.png'),
                          Text(
                            "Science",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black87,
                      ),
                      width: 150.0,
                      height: 150.0,
                      child: Column(
                        children: [
                          Image.asset('images/cloud-network.png'),
                          Text(
                            "Technology",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black87,
                      ),
                      width: 150.0,
                      height: 150.0,
                      child: Column(
                        children: [
                          Image.asset('images/cloud-network.png'),
                          Text(
                            "General Facts",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
