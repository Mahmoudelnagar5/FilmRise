import 'package:flimrize/features/movies/presentation/controller/trailer_bloc/trailer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../widgets/trailer_view_body.dart';

class TrailerView extends StatelessWidget {
  const TrailerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrailerBloc, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return const Center(
              child: SpinKitWaveSpinner(
                color: Colors.white,
                size: 80,
              ),
            );
          }
          if (state is TrailerError) {
            return CustomErrorWidget(error: state.errMessage);
          }
          if (state is TrailerLoaded) {
            return TrailerViewBody(id: state.trailer.key);
          }
          return Container();
        },
      ),
    );
  }
}
