
import 'package:flutter/material.dart';

import '../../style/colors.dart';

class AddChat extends StatelessWidget {
  const AddChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: Mycolors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
