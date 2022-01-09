import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.filter_list),
          )
        ],
      ),
      body: Lists(),
    );
  }
}

class Item {
  final String? titlename;
  final String? description;
  final String? username;
  final String? likes;
  final String? userimage;
  final String? postimage;

  Item(
      {this.titlename,
      this.description,
      this.username,
      this.likes,
      this.userimage,
      this.postimage});
}

class Lists extends StatelessWidget {
  final List<Item> _data = [
    Item(
        titlename: 'Gardens By the Bay',
        description: "Gardens",
        username: "Singapore",
        likes: "5.0/80",
        userimage: "10 %",
        postimage:
            "https://images.pexels.com/photos/672142/pexels-photo-672142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        titlename: 'Gardens By the Bay',
        description: "Gardens",
        username: "Singapore",
        likes: "5.0/80",
        userimage: "10 %",
        postimage:
            "https://images.pexels.com/photos/672142/pexels-photo-672142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        titlename: 'Gardens By the Bay',
        description: "Gardens",
        username: "Singapore",
        likes: "5.0/80",
        userimage: "10 %",
        postimage:
            "https://images.pexels.com/photos/672142/pexels-photo-672142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(6),
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          Item item = _data[index];
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.userimage!),
                  ),
                  title: Text(
                    item.username!,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                            height: 200.0,
                            color: Colors.blueAccent,
                            padding: const EdgeInsets.all(16.0),
                            width: double.infinity,
                            child: Image.network(
                              item.postimage!,
                              fit: BoxFit.contain,
                            )),
                      ],
                    ),
                    Text(
                      item.titlename!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item.description!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ]);
        });
  }
}
