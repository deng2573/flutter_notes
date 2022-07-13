import 'package:flutter/material.dart';
import 'package:notes/core/widgets/widget_button.dart';

final tools = [
  ToolsItem(label: '图片', icon: Icons.photo),
  ToolsItem(label: '视频', icon: Icons.video_call),
  ToolsItem(label: '图片', icon: Icons.photo),
  ToolsItem(label: '视频', icon: Icons.video_call),
  ToolsItem(label: '图片', icon: Icons.photo),
  ToolsItem(label: '视频', icon: Icons.video_call),
  ToolsItem(label: '图片', icon: Icons.photo),
  ToolsItem(label: '视频', icon: Icons.video_call),
];

class ChatTools extends StatelessWidget {
  final void Function(int) onSelected;
  const ChatTools({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 0.5,
        crossAxisSpacing: 0.5,
      ),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        final tool = tools[index];
        return _buildItem(tool);
      },
    );
  }

  Widget _buildItem(ToolsItem tool) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(90, 226, 226, 226),
              offset: Offset(1, 1),
              blurRadius: 5,
            ),
            BoxShadow(
              color: Color.fromARGB(90, 226, 226, 226),
              offset: Offset(-1, 1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Icon(tool.icon),
            const SizedBox(height: 5),
            Text(
              tool.label,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class ToolsItem {
  final String label;
  final IconData icon;

  ToolsItem({
    required this.label,
    required this.icon,
  });
}
