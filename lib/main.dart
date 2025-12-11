import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

var logger = Logger();
void main() {
  runApp(const InitializeApp());
}

class InitializeApp extends StatelessWidget {
  const InitializeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          logger.e("Error Firebase");
          return FirebaseError();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          logger.i("Firebase connection done");
          return MyApp();
        }
        logger.i("Firebase Loading");
        return FirebaseLoading();
      },
    );
  }
}

class FirebaseError extends StatelessWidget {
  const FirebaseError({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text("Firebase Error"))),
    );
  }
}

class FirebaseLoading extends StatelessWidget {
  const FirebaseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text("Firebase Loading"))),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final databaseReference = FirebaseFirestore.instance;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void testDataSending() {
    try {
      databaseReference
          .collection("songs")
          .add({
            "title": "Isaorana ianao",
            "book": "Hasina",
            "page": 447,
            "lyrics": null,
            "keywords": ["isaorana", "ianao"],
          })
          .then((onValue) => logger.i("Success: $onValue"));
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(
              onPressed: () {
                testDataSending();
              },
              child: Text("Test data sending"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
