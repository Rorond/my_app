import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:my_app/core.dart';
import 'package:my_app/service/auth_service.dart';

mixin _BlocLifecycle {
  void initState() {}
  void dispose() {}
}

class AuthBloc extends Bloc<AuthEvent, AuthState> with _BlocLifecycle {
  AuthBloc() : super(AuthState()) {
    on<AuthChangeStatusEvent>((event, emit) {
      if (state.status == true) {
        state.status = false;
      } else {
        state.status = true;
      }
      emit(state.copyWith());
    });

    on<AuthLoadingEvent>((event, emit) async {
      state.isLoading = true;
      emit(state.copyWith());
    });

    on<AuthLoadingCompleteEvent>((event, emit) async {
      state.isLoading = false;
      emit(state.copyWith());
    });

    on<AuthLoginEvent>((event, emit) async {
      add(AuthLoadingEvent());
      bool login = await AuthService().login(state.username, state.password);
      add(AuthLoadingCompleteEvent());
      if (login == true) {
        Get.offAll(const DashboardView());
      }
      // emit(state.copyWith());
    });
  }

  @override
  void initState() {
    //initState event
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
