import 'package:flutter/material.dart';

/// A configuration object for customizing the behavior of a
/// [DraggableScrollableSheet]-based widget.
///
/// This includes initial, minimum, and maximum sizes, snapping behavior,
/// animation control, and closing behavior.
/// SafeArea is used when [DragConfig] is used
class DragConfig {
  /// The initial fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// This value must be between [minChildSize] and [maxChildSize].
  ///
  /// Rebuilding the sheet with a new [initialChildSize] will only move
  /// the sheet to the new value if it has not yet been dragged since it
  /// was first built or since the last call to [DraggableScrollableActuator.reset].
  ///
  /// The default value is `0.5`.
  final double initialChildSize;

  /// The minimum fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// Must be less than or equal to [initialChildSize] and [maxChildSize].
  ///
  /// The default value is `0.25`.
  final double minChildSize;

  /// The maximum fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// Must be greater than or equal to [initialChildSize] and [minChildSize].
  ///
  /// The default value is `1.0`.
  final double maxChildSize;

  /// Whether the widget should expand to fill the available space in its parent.
  ///
  /// Typically, this should be `true`. Set to `false` when the parent widget
  /// (like [Center]) sizes this sheet based on its intrinsic size.
  ///
  /// The default value is `true`.
  final bool expand;

  /// Whether the widget should snap between [snapSizes] when the user lifts
  /// their finger after a drag.
  ///
  /// If the drag ends with a velocity, the sheet will snap in the direction
  /// of that drag. Otherwise, it will snap to the nearest snap size.
  ///
  /// Programmatic movements (e.g. via [DraggableScrollableController.animateTo])
  /// do not use snapping.
  ///
  /// Enabling snapping during a rebuild triggers a snap unless the sheet
  /// has not been dragged from its initial position.
  final bool snap;

  /// A list of fractional sizes to snap to when [snap] is true.
  ///
  /// These values must be in increasing order and within the range of
  /// [minChildSize] to [maxChildSize]. The min and max sizes are implicitly
  /// included even if not specified.
  ///
  /// For example, `snapSizes: [.5]` causes the sheet to snap to
  /// `[minChildSize, .5, maxChildSize]`.
  ///
  /// Changes to this list only take effect on rebuild.
  final List<double>? snapSizes;

  /// The duration to use for snap animations.
  ///
  /// If not set, the snap animation will use a duration based on distance
  /// to the target and current velocity.
  final Duration? snapAnimationDuration;

  /// A controller for programmatic control of the draggable sheet.
  ///
  /// Use this to animate or jump to specific positions.
  final DraggableScrollableController? controller;

  /// Whether the sheet should trigger a close action when it reaches
  /// [minChildSize].
  ///
  /// This is typically interpreted by parent widgets that listen to
  /// [DraggableScrollableNotification]s.
  final bool shouldCloseOnMinExtent;

  /// Creates a [DragConfig] instance with custom sheet behavior.
  ///
  /// All size parameters must satisfy:
  /// [minChildSize] ≤ [initialChildSize] ≤ [maxChildSize]
  /// and all [snapSizes] (if provided) must be within that range.
  DragConfig({
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 1.0,
    this.expand = true,
    this.snap = false,
    this.snapSizes,
    this.snapAnimationDuration,
    this.controller,
    this.shouldCloseOnMinExtent = true,
  })  : assert(minChildSize <= initialChildSize,
            'initialChildSize must be >= minChildSize'),
        assert(initialChildSize <= maxChildSize,
            'initialChildSize must be <= maxChildSize'),
        assert(minChildSize <= maxChildSize,
            'minChildSize must be <= maxChildSize'),
        assert(
          snapSizes == null ||
              snapSizes.every(
                  (size) => size >= minChildSize && size <= maxChildSize),
          'All snapSizes must be within minChildSize and maxChildSize',
        );
}
