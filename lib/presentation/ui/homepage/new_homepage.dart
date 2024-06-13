import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_exam/application/bloc/person/fetch_person/fetch_person_cubit.dart';
import 'package:pdax_exam/domain/entity/person/person_entity.dart';
import 'package:pdax_exam/presentation/ui/users_page/users_page.dart';
import 'package:pdax_exam/presentation/utility/global.dart' as global;
import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:pdax_exam/presentation/utility/size_config.dart';
import 'package:pdax_exam/presentation/utility/utils.dart';
import 'package:pdax_exam/presentation/widgets/custom_text_style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewHomepage extends StatefulWidget {
  const NewHomepage({super.key});

  @override
  State<NewHomepage> createState() => _NewHomepageState();
}

class _NewHomepageState extends State<NewHomepage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<DatumEntity> datumList = [];

  void _onRefresh(context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchPersonCubit>(context).fetchPersonsDataCubit(context, count: 10);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.palette2,
        title: const Text(constants.wordFetchPersons),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      // body: SmartRefresher(
      //   controller: _refreshController,
      //   enablePullDown: true,
      //   enablePullUp: true,
      //   onRefresh: _onRefresh,
      //   onLoading: _onLoading,
      //   child: _buildBlocBuilder(),
      // ),
      body: _buildBlocBuilder(context),
    );
  }

  Widget _buildBlocBuilder(context) =>
      BlocConsumer<FetchPersonCubit, FetchPersonState>(
        listener: (context, state) {
          if (state is FetchPersonSuccess) {
            _refreshController.refreshCompleted();
          } else if (state is FetchPersonFailure) {
            _refreshController.refreshFailed();
          }
        },
        builder: (context, state) {
          if (state is FetchPersonLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is FetchPersonSuccess) {
            datumList = state.persons;

            return _buildListViewBuilder(context);
          }
          if (state is FetchPersonFailure) {
            return const Center(child: Text('Error fetching data'));
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      );

  Widget _buildListViewBuilder(context) =>
      Container(
        color: global.palette2,
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: () {
            _onRefresh(context);
          },
          onLoading: _onLoading,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final data = datumList[index];
              return _buildDataLayers(data);
            },
          ),
        ),
      );

  Widget _buildDataLayers(DatumEntity entity) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 3,
          vertical: SizeConfig.safeBlockHorizontal * 2,
        ),
        child: GestureDetector(
          onTap: () => _onClickListener(entity.id!),
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 4),
                color: global.palette1
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
                  child: Row(
                    children: <Widget>[
                      //Image.network(entity.image!),
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 16,
                        height: SizeConfig.safeBlockHorizontal * 16,
                        decoration: BoxDecoration(
                          color: global.palette1,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: .5
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 1),
                          child: Image.asset(constants.imgProfilePlaceholder),
                        ),
                      ),
                      SizedBox(width: SizeConfig.safeBlockHorizontal * 3),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 63,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${constants.colonName} ${entity.firstname} ${entity.lastname}',
                              style: textColored3(context, global.palette5, FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${constants.colonEmail} ${entity.email}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      );

  void _onClickListener(int id) {
    Utils().pushScreen(context, UsersPage(id: id, datumList: datumList));
  }
}
