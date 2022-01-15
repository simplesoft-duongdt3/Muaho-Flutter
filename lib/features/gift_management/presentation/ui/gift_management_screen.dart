import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extensions/ui/inject.dart';
import '../bloc/gift_management_bloc.dart';

class GiftManagementArgument extends Equatable {
  @override
  List<Object?> get props => [];
}

class GiftManagementScreen extends StatelessWidget {
  static final String routeName = "/gift-management";

  final GiftManagementArgument argument;

  const GiftManagementScreen({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GiftManagementBloc>(
      create: (context) => inject(),
      child: BlocListener<GiftManagementBloc, GiftManagementState>(
        listener: (context, state) {
          // todo implement listener
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("GiftManagementScreen"),
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder(
      buildWhen: (pre, cur) => cur is GiftManagementRenderState,
      builder: (context, state) {
        if (state is SuccessRenderState) {
          return _buildSuccessRenderState();
        } else if (state is LoadingRenderState) {
          return _buildLoadingRenderState();
        } else {
          return _buildErrorRenderState();
        }
      },
    );
  }

  Widget _buildSuccessRenderState() {
    return Text("SuccessRenderState");
  }

  Widget _buildLoadingRenderState() {
    return Text("LoadingRenderState");
  }

  Widget _buildErrorRenderState() {
    return Text("ErrorRenderState");
  }
}
