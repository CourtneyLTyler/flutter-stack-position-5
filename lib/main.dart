import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
          backgroundColor: Colors.indigo,
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      // child: ListView.separated(
      //   // fit: StackFit.expand,
      //   // children: createSquares(25),
      //   itemCount: 25,
      //   itemBuilder: (context, index) => createSquare(index),
      //   separatorBuilder: (context, index) => createSeparator(index),
      //   // scrollDirection: Axis.horizontal,
      // ),
      // child: ListView(
      //   children: showContacts(),
      // ));
      child: GridView.count(
        // how many cells show in the non-scroll direction (horizontally here)
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: createGallery(50),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5),
      ),
    );
  }
}

List<Widget> createSquares(int numSquares) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = [];
  // squares.add(
  //   Container(
  //     color: Colors.black,
  //   ),
  // );
  while (i < numSquares) {
    Positioned square = Positioned(
        top: 100 + i.toDouble() * 100,
        left: 25 + i.toDouble() * 25,
        child: Container(
          color: colors[i % 5],
          // width: 60.0 * (numSquares - i),
          // height: 60.0 * (numSquares - i),
          width: 100,
          height: 100.0,
          child: Text(i.toString()),
        ));
    i++;
    squares.add(square);
  }
  return squares;
}

Widget createSquare(int position) {
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  Container square = Container(
    color: colors[position % 5],
    // width: 60.0 * (numSquares - i),
    // height: 60.0 * (numSquares - i),
    width: 100,
    height: 100.0,
    child: Text(position.toString()),
  );
  return square;
}

Widget createSeparator(int position) {
  Widget separator = Container(height: 15, color: Colors.black);
  return separator;
}

List<Widget> showPizzaLayout(double sizeX, double sizeY) {
  List<Widget> layoutChildren = [];
  Container backGround = Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              'https://media.istockphoto.com/photos/pizza-with-very-much-cheese-melting-picture-id1269122740?k=20&m=1269122740&s=612x612&w=0&h=8BN_S6Z3R9ACEq-xIjewm9E4Jn0gaDSW-fF2wmWKTpA='),
          fit: BoxFit.fitHeight),
    ),
  );
  layoutChildren.add(backGround);
  Positioned pizzaCard = Positioned(
    top: sizeY / 20,
    left: sizeX / 20,
    child: Card(
      elevation: 12,
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(
            'Pizza Margharita',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange[800]),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'This delicious pizza is made of Tomato, Basil, and Mozarella',
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    ),
  );
  layoutChildren.add(pizzaCard);
  Positioned buttonOrder = Positioned(
    bottom: sizeY / 20,
    left: sizeX - sizeX / 10,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: Colors.orange[900],
      ),
      child: Text(
        'Order Now!',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () {},
    ),
  );
  layoutChildren.add(buttonOrder);
  return layoutChildren;
}

List<Contact> buildContacts() {
  List<Contact> contacts = [];
  contacts
      .add(Contact('Thomas Anderson', 'The Matrix', Icons.sentiment_neutral));
  contacts.add(
      Contact('Bruce Wayne', 'The Dark Knight', Icons.sentiment_dissatisfied));
  contacts.add(
      Contact('Jamal Malik', 'The Millionaire', Icons.sentiment_satisfied));
  return contacts;
}

List<ListTile> showContacts() {
  List<Contact> contacts = buildContacts();
  for (int i = 0; i < 20; i++) {
    contacts.addAll(buildContacts());
  }
  List<ListTile> list = [];
  contacts.forEach((contact) {
    list.add(
      ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subtitle),
        leading: CircleAvatar(
          backgroundColor: Colors.amber[600],
          child: Icon(contact.icon),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => true,
      ),
    );
  });
  return list;
}

class Contact {
  String name;
  String subtitle;
  IconData icon;
  Contact(this.name, this.subtitle, this.icon);
}

List<Widget> createGallery(int numImages) {
  List<Widget> images = [];
  List<String> urls = [];
  urls.add(
      'https://images.freeimages.com/images/small-previews/e07/car-1568850.jpg');
  urls.add(
      'https://images.freeimages.com/images/small-previews/a25/japanes-car-1449114.jpg');
  urls.add('http://bit.ly/gv_car_3');
  urls.add('http://bit.ly/gv_car_4');
  urls.add('http://bit.ly/gv_car_5');
  Widget image;
  int i = 0;
  while (i < numImages) {
    image = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(urls[i % 5]),
          fit: BoxFit.contain,
        ),
      ),
      // child: Image.network(urls[i % 5]),
    );
    images.add(image);
    i++;
  }
  return images;
}
