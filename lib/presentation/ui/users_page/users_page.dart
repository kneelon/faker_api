import 'package:pdax_exam/domain/entity/person/person_entity.dart';
import 'package:pdax_exam/infrastructure/model/person/person_model.dart';
import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:pdax_exam/presentation/utility/size_config.dart';

class UsersPage extends StatefulWidget {
  final int id;
  final List<DatumModel> datumList;
  const UsersPage({
    super.key,
    required this.id,
    required this.datumList,
  });

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${constants.colonUserId} ${widget.id}'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              _buildImageProfile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageProfile() =>
    Image.network('src');
}
