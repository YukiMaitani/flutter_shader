import 'package:flutter/material.dart';

import '../../util/path_util.dart';

class OverTheMoonPage extends StatelessWidget {
  const OverTheMoonPage({super.key});

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
        _buildListTile(vectorLinePage),
        _buildListTile(crossLinePage),
        _buildListTile(topWhitePage),
        _buildListTile(whiteLinePage),
        _buildListTile(whiteBoxPage),
        _buildListTile(trapeziumPage),
        _buildListTile(trunkPage),
        _buildListTile(treePage),
        _buildListTile(treeFunctionPage),
        _buildListTile(shadowPage),
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
