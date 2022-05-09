import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';

/// [BuildContext] objects are actually [Element] objects. The [BuildContext]
/// interface is used to discourage direct manipulation of [Element] objects.
extension BuildContextExtension on BuildContext {
  // Simplified flutter localizations.
  // using the `!` operator everywhere is not good practice.
  //
  // At runtime this will never be null, as long as we call it inside
  // a *descendant* of MaterialApp (which is always the case).
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  // Simplified flutter theme.
  ThemeData get theme => Theme.of(this);

  // Simplified flutter focus scope.
  FocusScopeNode get focusScopeNode => FocusScope.of(this);
}
