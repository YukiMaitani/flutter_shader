import 'package:flutter/material.dart';
import 'package:flutter_shader/util/path_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shaders'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        _buildListTile(showImagePage),
        _buildListTile(negaPosiReversePage),
        _buildListTile(imageTransitionPage),
        _buildListTile(overTheMoonPage),
        _buildListTile(uvPage),
        // INSERT TILE HERE
      ],
    );
  }

  Widget _buildListTile(String name) {
    return Builder(builder: (context) {
      return ListTile(
        title: Text(name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => getPage(name),
            ),
          );
        },
      );
    });
  }
}
