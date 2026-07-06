// English defaults for user-visible copy and internal validation messages.
// Override via widget parameters or [GameUiStringsTheme].

// ---------------------------------------------------------------------------
// Dialogs — action labels
// ---------------------------------------------------------------------------

const String kGameDialogOk = 'OK';
const String kGameDialogCancel = 'Cancel';

// ---------------------------------------------------------------------------
// Toggle — default on/off labels
// ---------------------------------------------------------------------------

const String kGameToggleOnLabel = 'ON';
const String kGameToggleOffLabel = 'OFF';

// ---------------------------------------------------------------------------
// Semantics — defaults
// ---------------------------------------------------------------------------

const String kGameSemanticStarRatingDefault = 'Star rating';

String kGameSemanticStarIndexLabel(int indexOneBased, int maxStars) =>
    'Star $indexOneBased of $maxStars';

String kGameSemanticStepAllCompleted(int total) => 'All $total steps completed';

String kGameSemanticStepCurrent({
  required int stepDisplayOneBased,
  required int total,
  required String stepLabel,
}) =>
    'Step $stepDisplayOneBased of $total'
    '${stepLabel.isEmpty ? '' : ', $stepLabel'}';

const String kGameSemanticBannerDefault = 'Banner';

const String kGameSemanticLoadingDefault = 'Loading';

const String kGameSemanticSnackBarDefault = 'Notification';

const String kGameSemanticBottomSheetDefault = 'Bottom sheet';

const String kGameSemanticDismissDefault = 'Dismiss';
