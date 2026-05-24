// English defaults for user-visible copy and internal validation messages.
// Override via widget parameters or [GameUiStringsTheme].

// ---------------------------------------------------------------------------
// Dialogs — action labels
// ---------------------------------------------------------------------------

const String kGameDialogOk = 'OK';
const String kGameDialogCancel = 'Cancel';

// ---------------------------------------------------------------------------
// Inputs — hints & tooltips
// ---------------------------------------------------------------------------

const String kGameSearchDefaultHint = 'Search...';

const String kGamePasswordShowTooltip = 'Show password';
const String kGamePasswordHideTooltip = 'Hide password';

// ---------------------------------------------------------------------------
// Semantics — defaults
// ---------------------------------------------------------------------------

const String kGameSemanticRangeDefaultLabel = 'Range';

const String kGameSemanticRangeSliderHint =
    'Drag each handle or tap the track to adjust the range';

const String kGameSemanticStarRatingDefault = 'Star rating';

const String kGameSemanticStarHalfHint =
    'Left half or right half for different values';

String kGameSemanticStarIndexLabel(int indexOneBased, int maxStars) =>
    'Star $indexOneBased of $maxStars';

String kGameSemanticStepAllCompleted(int total) => 'All $total steps completed';

String kGameSemanticStepCurrent({
  required int stepDisplayOneBased,
  required int total,
  required String stepLabel,
}) => 'Step $stepDisplayOneBased of $total, $stepLabel';

const String kGameSemanticDividerDefault = 'Divider';

const String kGameSemanticBannerDefault = 'Banner';

const String kGameSemanticLoadingDefault = 'Loading';

const String kGameSemanticTooltipDefault = 'Tooltip';

const String kGameSemanticSnackBarDefault = 'Notification';

const String kGameSemanticBottomSheetDefault = 'Bottom sheet';

const String kGameSemanticDismissDefault = 'Dismiss';
