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

/// Bear-only poses. Unlike [GameMascotPose] (shared by every [GameMascot]),
/// these exist only for [GameMascot.bear].
///
/// The enum name is a clean English label; [file] is the actual bundled PNG
/// basename under `mascots/bears/`. Some source files carry typos
/// (`suprised`, `sleppy_1`) or `_N` variant suffixes — those are normalized
/// to readable Dart names here while [file] still points at the real asset.
enum GameBearPose {
  almostThere(file: 'almost_there'),
  artist(file: 'artist'),
  astronaut(file: 'astronaut'),
  athlete(file: 'athlete'),
  brave(file: 'brave'),
  braveAlt(file: 'brave_1'),
  builder(file: 'builder'),
  calculating(file: 'calculating'),
  caring(file: 'caring'),
  caringAlt(file: 'caring_1'),
  celebrating(file: 'celebrating'),
  champion(file: 'champion'),
  checking(file: 'checking'),
  chef(file: 'chef'),
  concentrating(file: 'concentrating'),
  confused(file: 'confused'),
  correctAnswer(file: 'correct_answer'),
  counting(file: 'counting'),
  countingAlt(file: 'counting_1'),
  creative(file: 'creative'),
  curious(file: 'curios'),
  curiousAlt(file: 'curios_1'),
  detective(file: 'detective'),
  determined(file: 'determined'),
  doubleCheck(file: 'double_check'),
  encouraging(file: 'encouraging'),
  explorer(file: 'explorer'),
  exploring(file: 'exploring'),
  fastSolver(file: 'fast_solver'),
  focusMode(file: 'focus_mode'),
  friendly(file: 'friendly'),
  friendlyAlt(file: 'friendly_1'),
  giftOpener(file: 'gift_opener'),
  happy(file: 'happy'),
  happyAlt(file: 'happy_1'),
  helpful(file: 'helpful'),
  helpfulAlt(file: 'helpful_1'),
  helping(file: 'helping'),
  hugging(file: 'hugging'),
  idea(file: 'idea'),
  inventing(file: 'inventing'),
  keepGoing(file: 'keep_going'),
  kind(file: 'kind'),
  kindAlt(file: 'kind_1'),
  leader(file: 'leader'),
  learning(file: 'learning'),
  learningFromMistake(file: 'learning_from_mistake'),
  levelUp(file: 'level_up'),
  mathStar(file: 'math_star'),
  musician(file: 'musician'),
  neverGiveUp(file: 'never_give_up'),
  neverGiveUpAlt(file: 'never_give_up_1'),
  oops(file: 'oops'),
  oopsAlt(file: 'oops_1'),
  perfectScore(file: 'perfect_score'),
  pointing(file: 'pointing'),
  problemSolver(file: 'problem_solver'),
  professor(file: 'professor'),
  reading(file: 'reading'),
  readingAlt(file: 'reading_1'),
  relaxed(file: 'relaxed'),
  robot(file: 'robot'),
  running(file: 'running'),
  scientist(file: 'scientist'),
  sharing(file: 'sharing'),
  sharingAlt(file: 'sharing_1'),
  sick(file: 'sick'),
  sitting(file: 'sitting'),
  skating(file: 'skating'),
  sleepy(file: 'sleepy'),
  sleepyAlt(file: 'sleepy_1'),
  sleepyAlt2(file: 'sleppy_1'),
  solving(file: 'solving'),
  star(file: 'star'),
  stuck(file: 'stuck'),
  superHeroFlying(file: 'super_hero_flying'),
  superHeroStanding(file: 'super_hero_standing'),
  surprised(file: 'suprised'),
  thankful(file: 'thankful'),
  thankfulAlt(file: 'thankful_1'),
  thinking(file: 'thinking'),
  thinkingAlt(file: 'thinking_1'),
  tired(file: 'tired'),
  triumphant(file: 'triumphant'),
  tryAgain(file: 'try_again'),
  winner(file: 'winner'),
  winnerAlt(file: 'winner_1'),
  winnerAlt2(file: 'winner_2'),
  winnerAlt3(file: 'winner_3'),
  wizard(file: 'wizard'),
  working(file: 'working'),
  workingHard(file: 'working_hard'),
  writing(file: 'writing');

  const GameBearPose({required this.file});

  /// Bundled PNG basename (without extension) under `mascots/bears/`.
  final String file;
}
