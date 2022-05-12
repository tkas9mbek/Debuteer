import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ChessBoardController _controller = ChessBoardController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
    backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text("Chess Game"),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ChessBoard(
                controller: _controller,
                boardColor: BoardColor.green,
                boardOrientation: PlayerColor.white,
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Chess>(
                valueListenable: _controller,
                builder: (context, game, _) => Text(
                  _controller.getSan().fold(
                        '',
                        (previousValue, element) => '$previousValue\n${element ?? ''}',
                      ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
