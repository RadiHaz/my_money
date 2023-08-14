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
  int _counterResetTaps = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    setState(() {
      _counterResetTaps++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  _matchColors(param) {
    return BoxDecoration(
      gradient: LinearGradient(
          colors: param,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: const GradientRotation(3.14 / 6)),
      shape: BoxShape.circle,
    );
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
            Text(
              'You have pushed the Reset button $_counterResetTaps times',
              style: const TextStyle(color: Colors.deepOrange),
            ),
            const Text(
              'Current value:',
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
          FloatingActionButton(
              onPressed: _resetCounter,
              backgroundColor: Colors.deepOrange,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.restart_alt_rounded, color: Colors.white,),
              )),
          FloatingActionButton(
              onPressed: _decrementCounter,
              backgroundColor: null,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.exposure_minus_1_rounded, color: Colors.black87,),
              )), // button third
          FloatingActionButton(
              onPressed: _incrementCounter,
              backgroundColor: null,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.plus_one_rounded,  color: Colors.black87,),
              )),
          // Add more buttons here
        ],
      ),
    );
  }
}
