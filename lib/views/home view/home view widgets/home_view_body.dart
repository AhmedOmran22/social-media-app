import 'package:flutter/material.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/post_builder.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/send_post_.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        children: [
          Expanded(
            child: PostBuilder(),
          ),
          SendPostView(),
        ],
      ),
    );
  }
}
