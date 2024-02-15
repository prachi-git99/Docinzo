import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final TextEditingController _controller = TextEditingController();
  final List<Widget> _painters = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dfghj"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            FloatingActionButton(
              onPressed: () {
                String svg = RandomAvatarString(
                  DateTime.now().toIso8601String(),
                  trBackground: false,
                );
                log(svg);

                _painters.add(
                  RandomAvatar(
                    DateTime.now().toIso8601String(),
                    height: 50,
                    width: 52,
                  ),
                );
                _controller.text = svg;
                setState(() {});
              },
              tooltip: 'Generate',
              child: const Icon(Icons.gesture),
            ),
            const SizedBox(height: 20),
            ..._painters,
          ],
        ),
      ),
    );
  }
}
