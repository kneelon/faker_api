
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _buildListViewBuilder(),
            //_buildNoMoreData(),
          ],
        )
      ),
    );
  }

  Widget _buildListViewBuilder() =>
    Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
}
