import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'model.dart';

class PotPage extends StatefulWidget {
  const PotPage({Key? key, required this.pot}) : super(key: key);

  final Pot pot;

  @override
  State<PotPage> createState() => _PotPageState();
}

class _PotPageState extends State<PotPage> {
  bool isLiked = false;

  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pot.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(widget.pot.image),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(widget.pot.description),
            const SizedBox(
              height: 20,
            ),
            LikeButton(
              size: 30,
              isLiked: isLiked,
              likeCount: likeCount,
            )
          ],
        ),
      ),
    );
  }
}
