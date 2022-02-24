import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  Color color1 = const Color.fromRGBO(124, 220, 149, 1);
  Color color2 = const Color.fromRGBO(33, 207, 184, 1);
  Color backgroundColor = const Color.fromRGBO(241, 240, 246, 1);

  Container circle() {
    return Container(
      height: 240,
      width: 240,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          //creating a custom app bar
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color1,
                        color2,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: -60,
                  left: -60,
                  child: circle(),
                ),
                const Positioned(
                  top: 50,
                  left: 15,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/e5_profile.jpeg"),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Payday of the week",
                      style: TextStyle(
                        color: color2,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 15,
                  bottom: 60,
                  child: Text(
                    "Total balance to spend",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                    left: 15,
                    bottom: 20,
                    child: Text(
                      '\$3400',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                      ),
                    ))
              ],
            ),
          ),

          //creating section title
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverToBoxAdapter(
              child: SectionHeader(
                title: "Planning Ahead",
                actionText: "-\$3453.52",
              ),
            ),
          ),

          //Horizontal Cards list
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 120,
                child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Wrap(
                            spacing: 10,
                            direction: Axis.vertical,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/e5_$index.png"),
                                  ),
                                ),
                              ),
                              Text(
                                "-159.34",
                                style: TextStyle(
                                  color: color2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "In 2 days",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),

          //Divider
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: const Divider(),
            ),
          ),

          // Header for scrolling container
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverToBoxAdapter(
              child: SectionHeader(
                title: "Last Month Expense",
                actionText: "-\$5932.14",
              ),
            ),
          ),

          // Scrolling calendar
          SliverToBoxAdapter(
            child: Container(
              height: 60,
              child: ListView.builder(
                  itemCount: 30,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Text(
                            "Mar",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 1),
                  padding: EdgeInsets.all(10),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/e5_$index.png"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "Craftwork",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text("-130.00")
                    ],
                  ),
                );
              }, childCount: 7),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: color2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_membership_outlined,
            ),
            label: "Spend",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_membership_outlined,
            ),
            label: "Spend",
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;

  const SectionHeader({
    Key? key,
    required this.title,
    required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              actionText,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right_rounded,
              ),
            )
          ],
        )
      ],
    );
  }
}
