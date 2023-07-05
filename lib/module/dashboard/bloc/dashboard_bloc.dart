import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/service/article_service.dart';
import '../event/dashboard_event.dart';
import '../state/dashboard_state.dart';

mixin _BlocLifecycle {
  void initState() {}
  void dispose() {}
}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>
    with _BlocLifecycle {
  DashboardBloc() : super(DashboardState()) {
    on<DashboardIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });

    on<DashboardGetArticleEvent>((event, emit) async {
      final data = await ArticleService().getData("1");
      state.articles = data;
      emit(state.copyWith());
    });
  }

  @override
  void initState() {
    //initState event
    add(DashboardGetArticleEvent());
    super.initState();
  }

  @override
  void dispose() {
    //dispose event
    super.dispose();
  }

  @override
  Future<void> close() {
    dispose();
    return super.close();
  }
}
