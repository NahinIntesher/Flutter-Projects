import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme.background;
    final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Task Lists 2",
          style: TextStyle(
            fontFamily: 'Fira Code',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 20),
          //   child: ClipOval(
          //     child: SizedBox(
          //       width: deviceWidth * 0.1,
          //       height: deviceHeight * 0.05,
          //       child: Image.network(
          //           'https://images.unsplash.com/photo-1713782522146-3ac703ab3bce?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(right: deviceWidth * 0.04),
            child: CircleAvatar(
              radius: deviceWidth * 0.045,
              // backgroundColor: Theme.of(context).colorScheme.secondary,
              backgroundImage: const NetworkImage(
                  'https://images.unsplash.com/photo-1713782522146-3ac703ab3bce?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.circle_outlined)),
            title: const Text(
              "ADD KHULNA DIVISION ADD KHULNA DIVISION ADD KHULNA DIVISION ADD KHULNA DIVISION ADD KHULNA DIVISION ADD KHULNA DIVISION moreeeeeee",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.star_border_outlined)),
          )
        ],
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}
