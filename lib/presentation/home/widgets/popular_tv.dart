import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_cubit.dart';
import '../../../common/widget/tv/tv_card.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvCubit()..getPopularTv(),
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
          if (state is PopularTvLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is PopularTvLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.tvList[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.tvList.length,
              ),
            );
          }
          if (state is FailureLoadPopularTv) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
