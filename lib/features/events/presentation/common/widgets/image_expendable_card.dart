import 'package:flutter/material.dart';

class ImageExpandableCard extends StatefulWidget {
  final String text;
  const ImageExpandableCard({super.key, required this.text});

  @override
  State<ImageExpandableCard> createState() => _ImageExpandableCardState();
}

class _ImageExpandableCardState extends State<ImageExpandableCard> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: [
          Text(widget.text, maxLines: _expanded ? null : 2),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Text(_expanded ? "afficher moins" : "afficher plus..."),
            ),
          ),
        ],
      ),
    );
  }
}
