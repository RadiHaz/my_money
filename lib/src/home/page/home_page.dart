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
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Icon(Icons.ice_skating);
    return Scaffold(
      appBar: AppBar(
        // Theme.of(context).colorScheme.inversePrimary
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
        centerTitle: true,
        leading: const Icon(Icons.verified_user_rounded),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.purple,
                Colors.white,
              ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(3.14 / 6)
              ),
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
                onPressed: _resetCounter,
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.restart_alt_rounded)),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.purple,
                Colors.white,
              ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(3.14 / 6)
              ),
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
                onPressed: _decrementCounter,
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.exposure_minus_1)),
          ),// button third
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.purple,
                Colors.white,
              ], 
                  begin: Alignment.topLeft, 
                  end: Alignment.bottomRight,
                transform: GradientRotation(3.14 / 6)
              ),
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
                onPressed: _incrementCounter,
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.exposure_plus_1)),
          ),
          // Add more buttons here
        ],
      ),
    );
  }
}
