import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app/models/articles/articles.dart';
part 'dashboard_state.freezed.dart';

@unfreezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    @Default(0) int counter,
    @Default([]) List<Articles> articles,
  }) = _DashboardState;
}
