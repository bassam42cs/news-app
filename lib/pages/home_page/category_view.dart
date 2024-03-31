import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/pages/home_page/category_view_model.dart';
import 'package:news_app/pages/home_page/tab_bar_list_view.dart';

import '../../model/source_model.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel selected;
  var viewModel = CategoryViewModel();

  CategoryView({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.loadNewsSourcse(selected.id);
    return BlocBuilder<CategoryViewModel, CategoryViewState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          // show loading
          return Center(
            child: Column(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(),
                Text(
                  state.loadingMessage ?? "",
                ),
              ],
            ),
          );
        }
        if (state is ErrorState) {
          // show error
          return Column(
            children: [
              Text(state.errorMessage ?? ""),
              IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.refresh_outlined),
              ),
            ],
          );
        }
        if (state is SuccessState) {
          // show result
          List<Sources> source = state.sources;
          return TabBarListView(source);
        }
        return Container();
      },
    );

  }
}
