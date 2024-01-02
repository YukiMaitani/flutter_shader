import 'package:flutter/material.dart';

import '../../util/path_util.dart';

class PixelSpiritDeckPage extends StatelessWidget {
  const PixelSpiritDeckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PixelSpiritDeck'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
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
