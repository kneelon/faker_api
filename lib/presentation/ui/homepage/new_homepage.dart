import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_exam/application/bloc/person/fetch_person/fetch_person_cubit.dart';
import 'package:pdax_exam/domain/entity/person/person_entity.dart';
import 'package:pdax_exam/infrastructure/model/person/person_model.dart';
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
  List<DatumModel> datumList = [];
  int _itemsLoaded = 0;
  final int _itemsPerPage = 20;
  final int _maxDataLength = 100;
  bool _noMoreData = false;

  void _onRefresh(context) async {
    _itemsLoaded = 0;
    _noMoreData = false;
    await BlocProvider.of<FetchPersonCubit>(context)
        .fetchPersonsDataCubit(context, _itemsLoaded, _itemsPerPage);
    _refreshController.refreshCompleted();
  }

  void _onLoading(context) async {
    if (_itemsLoaded < _maxDataLength) {
      _itemsLoaded += _itemsPerPage;
      await BlocProvider.of<FetchPersonCubit>(context)
          .fetchPersonsDataCubit(context, _itemsLoaded, _itemsPerPage);
      if (_itemsLoaded >= _maxDataLength) {
        _noMoreData = true;
      }
    }
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchPersonCubit>(context).fetchPersonsDataCubit(context, _itemsLoaded, 10);
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
            if (_itemsLoaded == 0) {
              datumList = state.persons;
            } else {
              datumList.addAll(state.persons);
            }
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
          enablePullUp: _noMoreData ? false : true,
          onRefresh: () {
            _onRefresh(context);
          },
          onLoading: () {
            _onLoading(context);
          },
          child: ListView.builder(
            itemCount: datumList.length + 1,
            itemBuilder: (context, index) {
              if (index == datumList.length) {
                return _noMoreData
                  ? Center(child: Text('No more data', style: textColored6(context, global.errorColor, FontWeight.normal),))
                  : const Center(child: CircularProgressIndicator.adaptive());
              }
              final data = datumList[index];
              return _buildDataLayers(data);
            },
          ),
        ),
      );

  Widget _buildDataLayers(DatumModel entity) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 3,
          vertical: SizeConfig.safeBlockHorizontal * 2,
        ),
        child: GestureDetector(
          onTap: () => _onClickListener(entity.id),
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
                            Text('ID No: ${entity.id}'),
                            Text(
                              '${constants.colonName} ${entity.firstname} ${entity.lastname}',
                              style: textColored3(context, global.palette5, FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${constants.colonEmail} ${entity.email}',
                              maxLines: 1,
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
    //Utils().pushScreen(context, UsersPage(id: id, datumList: datumList));
  }

}
