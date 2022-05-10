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
      child: Stack(
        // fit: StackFit.expand,
        children: showPizzaLayout(sizeX, sizeY),
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
  squares.add(
    Container(
      color: Colors.black,
    ),
  );
  while (i < numSquares) {
    Positioned square = Positioned(
        top: 100 + i.toDouble() * 100,
        left: 25 + i.toDouble() * 25,
        child: Container(
          color: colors[i],
          width: 60.0 * (numSquares - i),
          height: 60.0 * (numSquares - i),
          child: Text(i.toString()),
        ));
    i++;
    squares.add(square);
  }
  return squares;
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
