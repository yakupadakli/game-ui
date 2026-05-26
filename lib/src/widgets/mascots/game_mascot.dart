/// The animal mascot family. Each member maps to a `mascots/<folderName>/`
/// directory in the bundled assets.
enum GameMascot {
  bear(folderName: 'bears'),
  elephant(folderName: 'elephants'),
  fox(folderName: 'foxes'),
  penguin(folderName: 'penguins');

  const GameMascot({required this.folderName});

  /// Folder name under `assets/images/mascots/`. Stored explicitly because
  /// the English plural of "fox" is irregular (foxes, not foxs).
  final String folderName;
}

/// Poses available for every [GameMascot]. The same enum value resolves to
/// `<mascot>_<pose>.png` for any character.
enum GameMascotPose {
  angry,
  congrats,
  construction,
  curious,
  head,
  hero,
  pointing,
  sitting,
  star,
  thinking,
  writing,
}
