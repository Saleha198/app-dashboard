import 'package:dash_board/model/bargraphmode.dart';

import 'package:dash_board/model/graphmodel.dart';
import 'package:flutter/material.dart';

class BarGraphData {
  final data = [
    BarGraphModel(
      label: 'FlatsSale',
      color: Colors.amber,
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 3),
        GraphModel(x: 4, y: 4),
        GraphModel(x: 5, y: 6),
      ],
    ),
    BarGraphModel(
      label: 'ShopSale',
      color: Color.fromARGB(255, 102, 7, 255),
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 4),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 10),
        GraphModel(x: 4, y: 6),
        GraphModel(x: 5, y: 8),
      ],
    ),
  ];

  final List<String> labels = ['M', 'T', 'W', 'T', 'F', 'S'];
}
