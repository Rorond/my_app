import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/dashboard_bloc.dart';
import '../state/dashboard_state.dart';

class DashboardProvider extends StatelessWidget {
  final Widget Function(BuildContext, DashboardBloc, DashboardState) builder;
  final Function(
    DashboardBloc bloc,
    DashboardState state,
  )? beforeInitState;
  const DashboardProvider({
    Key? key,
    required this.builder,
    this.beforeInitState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = DashboardBloc();
        if (beforeInitState != null) {
          beforeInitState!(bloc, bloc.state);
        }
        bloc.initState();
        return bloc;
      },
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          final bloc = context.read<DashboardBloc>();
          return builder(context, bloc, state);
        },
      ),
    );
  }
}

abstract class DashboardConsumerWidgetInterface {
  Widget buildView(
    BuildContext context,
    DashboardBloc bloc,
    DashboardState state,
  );

  beforeInitState(
    DashboardBloc bloc,
    DashboardState state,
  );
}

class DashboardConsumerWidget extends StatelessWidget
    implements DashboardConsumerWidgetInterface {
  const DashboardConsumerWidget({super.key});

  @override
  Widget buildView(
      BuildContext context, DashboardBloc bloc, DashboardState state) {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardProvider(
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
