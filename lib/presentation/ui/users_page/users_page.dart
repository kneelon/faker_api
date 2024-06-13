import 'package:pdax_exam/infrastructure/model/person/person_model.dart';
import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:pdax_exam/presentation/utility/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:pdax_exam/presentation/utility/size_config.dart';
import 'package:pdax_exam/presentation/widgets/custom_text_style.dart';
import 'package:pdax_exam/presentation/widgets/date_converter.dart';

class UsersPage extends StatefulWidget {
  final DatumModel model;
  const UsersPage({
    super.key,
    required this.model,
  });

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  late AddressModel _addressModel;
  String _gender = constants.male;
  final String comma = ', ';

  String _getAddress() {
    StringBuffer addressBuffer = StringBuffer()
      ..write(_addressModel.buildingNumber)
      ..write(comma)
      ..write(_addressModel.streetName)
      ..write(comma)
      ..write(_addressModel.street)
      ..write(comma)
      ..write(_addressModel.city)
      ..write(comma)
      ..write(_addressModel.country)
      ..write(comma)
      ..write(_addressModel.zipcode)
      ..write(comma)
      ..write(_addressModel.countyCode);

    return addressBuffer.toString();
  }

  void _getUsersData() {
    //Server is down, I am unable to load the image
    // I replaced with placeholder
    String imageUrl = widget.model.image;
    _gender = widget.model.gender;
    _addressModel = widget.model.address;
    debugPrint(imageUrl);
  }

  @override
  void initState() {
    super.initState();
    _getUsersData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.firstname),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildImageProfile(),
              _buildFullNameAndEmail(),
              _buildDisplayLayers(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageProfile() =>
    Center(
      child: Image.asset(
        constants.imgProfilePlaceholder,
        scale: 10,
      ),
    );

  Widget _buildFullNameAndEmail() =>
    Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 3
      ),
      child: SizedBox(
        width: SizeConfig.safeBlockHorizontal * 100,
        child: Column(
          children: <Widget>[
            Text(
              '${widget.model.firstname} ${widget.model.lastname}',
              style: textColored5(context, global.palette5, FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              widget.model.email,
              style: textStyle4(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );

  Widget _buildDisplayLayers() =>
    SizedBox(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildDataLayer(constants.colonIdNo, '${widget.model.id}'),
          _buildDataLayer(constants.colonPhone, widget.model.phone),
          _buildDataLayer(constants.colonBirthday, formatDate('${widget.model.birthday}')),
          _buildDataLayer(constants.colonGender, _gender),
          _buildDataLayer(constants.colonWebsite, widget.model.website),
          _buildDataLayer(constants.colonLatitude, '${widget.model.address.latitude}'),
          _buildDataLayer(constants.colonLongitude, '${widget.model.address.longitude}'),
          _buildAddressLayer(constants.colonAddress, widget.model.address),
        ],
      ),
    );

  Widget _buildDataLayer(String key, String value) =>
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 3,
        vertical: SizeConfig.safeBlockHorizontal * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key, style: textStyle3(context),),
          Text(value, style: textStyle3(context),),
        ],
      ),
    );

  Widget _buildAddressLayer(String key, AddressModel address) =>
      Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.safeBlockVertical * 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4),
            child: const Divider(),
          ),
          Text(key, style: textStyle4(context),),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 4,
            ),
            child: Text(
              _getAddress(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
