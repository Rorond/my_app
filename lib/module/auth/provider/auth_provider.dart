import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../state/auth_state.dart';

class AuthProvider extends StatelessWidget {
  final Widget Function(BuildContext, AuthBloc, AuthState) builder;
  final Function(
    AuthBloc bloc,
    AuthState state,
  )? beforeInitState;
  const AuthProvider({
    Key? key,
    required this.builder,
    this.beforeInitState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = AuthBloc();
        if (beforeInitState != null) {
          beforeInitState!(bloc, bloc.state);
        }
        bloc.initState();
        return bloc;
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final bloc = context.read<AuthBloc>();
          return builder(context, bloc, state);
        },
      ),
    );
  }
}

abstract class AuthConsumerWidgetInterface {
  Widget buildView(
    BuildContext context,
    AuthBloc bloc,
    AuthState state,
  );

  beforeInitState(
    AuthBloc bloc,
    AuthState state,
  );
}

class AuthConsumerWidget extends StatelessWidget
    implements AuthConsumerWidgetInterface {
  const AuthConsumerWidget({super.key});

  @override
  Widget buildView(BuildContext context, AuthBloc bloc, AuthState state) {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      builder: (context, bloc, state) {
        return buildView(context, bloc, state);
      },
    );
  }

  @override
  beforeInitState(bloc, state) {
    throw UnimplementedError();
  }
}
