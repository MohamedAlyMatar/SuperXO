class GameModel {
  final List<List<String>> board;
  final String currentPlayer;
  final bool isGameOver;
  final String winner;

  GameModel({
    required this.board,
    required this.currentPlayer,
    this.isGameOver = false,
    this.winner = '',
  });

  GameModel copyWith({
    List<List<String>>? board,
    String? currentPlayer,
    bool? isGameOver,
    String? winner,
  }) {
    return GameModel(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      isGameOver: isGameOver ?? this.isGameOver,
      winner: winner ?? this.winner,
    );
  }
}
