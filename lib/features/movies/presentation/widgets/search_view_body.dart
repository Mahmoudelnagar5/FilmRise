import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../controller/search_bloc/search_bloc.dart';
import 'search_view_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomSearchField(
              onChanged: (query) {
                BlocProvider.of<SearchBloc>(context).add(
                  GetSearchMovies(query),
                );
              },
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Expanded(
                    child: Center(
                      child: SpinKitWaveSpinner(
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  );
                } else if (state is SearchError) {
                  return Center(
                    child: CustomErrorWidget(error: state.errMessage),
                  );
                } else if (state is SearchLoaded) {
                  if (state.movies.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "No movies found",
                          style: AppStyles.styleMedium16,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: SearchViewList(
                      movies: state.movies,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "Search for favorite movies",
                        style: AppStyles.styleMedium16.copyWith(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
