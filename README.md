# maze_game

A simple maze game in Flutter. It also serves as a CustomPainter example.

<img src="https://github.com/robin0319/FL_MAZE-GAME/blob/main/img/maze.png" height="350">

## Maze package

[![pub](https://img.shields.io/badge/pub-3.0.0-blue)](https://pub.dev/packages/maze)
[![Project Status: Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

You can use it in your project, you only need to add the dependency:

```yaml
dependencies:
  flutter:
    sdk: flutter
  maze_game: 3.0.0
```

Now you can create your Maze:

```dart
Maze(
    player: MazeItem(
        'https://image.flaticon.com/icons/png/512/808/808433.png',
        ImageType.network),
    columns: column,
    rows: row,
    wallThickness: 4.0,
    wallColor: Theme.of(context).primaryColor,
    finish: MazeItem(
        'https://image.flaticon.com/icons/png/512/3328/3328644.png',
        ImageType.network),
    onFinish: ()=>showAlertDialog(context))));
```


