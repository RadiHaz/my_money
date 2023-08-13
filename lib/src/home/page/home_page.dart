
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Icon(Icons.ice_skating);
    return Scaffold(
      appBar: AppBar(
        // Theme.of(context).colorScheme.inversePrimary
        backgroundColor: Colors.amber,
        title: Text(widget.title),
        centerTitle: true,
        leading: const Icon(Icons.verified_user_rounded),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout_rounded))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: _resetCounter,
          child: const Text(
            "Reset counter",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ),
    );
  }
}