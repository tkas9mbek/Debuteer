String sanToPgn(List<String?> san) {
  var pgn = '';

  for (final element in san) {
    pgn += '$element ';
  }

  return pgn.trim();
}
