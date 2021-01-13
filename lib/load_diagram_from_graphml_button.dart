import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_canvas/model/canvas_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class LoadDiagramFromGraphmlButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color iconColor;

  const LoadDiagramFromGraphmlButton({
    Key key,
    this.size = 48,
    this.color = const Color(0x44000000),
    this.iconColor = Colors.white,
  })  : assert(size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CanvasModel>(
      builder: (_, canvasModel, __) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: iconColor,
            onPressed: () async {
              String dir = (await getExternalStorageDirectory()).path;
              String filePath = '$dir/exported2.graphml';
              canvasModel.loadDiagramFromFile(filePath);
            },
            tooltip: 'Load from GraphML',
            icon: const Icon(Icons.drive_folder_upload),
          ),
        );
      },
    );
  }
}