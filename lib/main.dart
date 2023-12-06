import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:santa_challange_memodio/add_child_form.dart';

import 'child_info_card.dart';
import 'objects_child.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChildListBloc(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Lottie.network(
                    "https://lottie.host/be9d7286-7760-479e-875b-a9530da110fd/jHHo99Lsb3.json",
                    height: 250),
                Text(
                  'Santa\'s Gifting list\n',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      height: 0),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.green.shade800,
                  ),
                  const Text('Nice child')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.red.shade800,
                  ),
                  const Text('Naughty child')
                ],
              ),
            ),
            Expanded(child: ChildList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddChildForm()));
        },
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          'Add Child',
          style: TextStyle(color: Colors.white, fontFamily: "Lato"),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class ChildList extends StatelessWidget {
  const ChildList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Child> children = context.watch<ChildListBloc>().children;

    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: ChildInfoCard(index: index),
        );
      },
    );
  }
}
