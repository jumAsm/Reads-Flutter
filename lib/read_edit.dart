import 'package:flutter/material.dart';
import 'package:reads/widget/edit_read_page.dart';

import 'models/read_model.dart';

class ReadEdit extends StatefulWidget {
  const ReadEdit({super.key, required this.reads});
  final ReadModel reads;

  @override
  State<ReadEdit> createState() => _ReadEditState();
}

class _ReadEditState extends State<ReadEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditReadPage(
        reads: widget.reads,
      ),
    );
  }
}
