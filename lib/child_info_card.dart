//Card View to display a child with changeable status
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'objects_child.dart';

class ChildInfoCard extends StatelessWidget {
  final int index;

  const ChildInfoCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Child> children = context.watch<ChildListBloc>().children;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              children[index].name,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Text(
              'From ${children[index].country}',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                  color: Colors.white70),
            ),
            ElevatedButton.icon(
              icon: Icon(
                children[index].isNice ? Icons.thumb_up : Icons.thumb_down,
                color: Colors.white60,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white10),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))))),
              onPressed: () {
                context.read<ChildListBloc>().toggleChildStatus(index);
              },
              label: Text(
                'Tap to change the status',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                    color: Colors.white60),
              ),
            )
          ],
        ),
      ),
      color:
          children[index].isNice ? Colors.green.shade800 : Colors.red.shade700,
      elevation: 7,
    );
  }
}
