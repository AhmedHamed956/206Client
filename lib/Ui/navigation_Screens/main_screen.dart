import 'dart:async';
import 'dart:ui';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/Models/update_Map_Model.dart';
import 'package:project/Shared/constant.dart';
import 'package:project/Ui/home/Cubit.dart';
import 'package:project/Ui/navigation_Screens/shopDetails.dart';
import 'package:project/components/component.dart';
import 'package:flutter/services.dart';

import '../../network/local/cache-helper.dart';
import '../home/states.dart';

class MainScreen extends StatefulWidget {
  final bool? isOffer;
  MainScreen({this.isOffer});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(24.7136, 46.6753), zoom: 14.0);
  late Uint8List markerIcon;
  late BitmapDescriptor customIcon;

  bool typing = false;
  TextEditingController search = TextEditingController();
  List<Marker> markers = <Marker>[];
  String? _currentAddress;
  LatLng? _currentLocation;
  // UpdateMapModelData? _locations;
  List<UpdateMapModelData> _locations = [];
  String? shopId;
  double? _currentlat;
  double? _currentlong;
  String? fullLocation;
  String? latlong;
  late HomeCubit _homeCubit;
  UpdateMapModel? searchLocation;
  UpdateMapModel? mapLocation;
  @override
  void initState() {
    _observeLocation();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(5, 5)), 'assets/images/206_Logo.png')
        .then((d) {
      customIcon = d;
    });
    // _observeLocation();
    _homeCubit = BlocProvider.of<HomeCubit>(context);

    super.initState();
  }

  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  // Position? _currentPosition;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  late GoogleMapController mapController;
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: SafeArea(
            child: Container(
              // color: Colors.red,
              child: AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
                elevation: 8,
                backgroundColor: Colors.white,
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: containerborderColor,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Image.asset(
                            'assets/images/Location.png',
                            // width: 15,
                            // height: 15,
                            color: button1color,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      _currentAddress != null
                          ? Container(
                              child: Text(
                                '${_currentAddress}',
                                style: TextStyle(
                                    color: appbarTextcolor, fontSize: 14),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<HomeCubit, HomeAppState>(
                listener: (BuildContext context, state) async {
              if (state is UpdateMapSuccess) {
                var model = HomeCubit.get(context).updateMapModel!;
                // _automatic = state.response.data!.autoAccpet!;
                // _observe = state.response.data!.active == 1 ? true : false;
                // Position position = await _determinePosition();

                // markers.clear();

                print('aaaaaaa');
                for (int i = 0; i < 3; i++) {
                  setState(() {
                    markers.add(Marker(
                        icon: customIcon,

                        //          onTap: (position) {
                        //   _customInfoWindowController.hideInfoWindow();
                        // },
                        onTap: () {
                          print('bbbbb');
                          _customInfoWindowController.addInfoWindow!(
                            Container(
                              color: Colors.white,
                              height: 49,
                              width: 128,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 9, vertical: 2),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.home_outlined,
                                          color: button1color,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                            ' ${model.data?[i].translations?.first.name}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: shopDetailnameColor))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 9, vertical: 2),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.pin,
                                              color: shopDetaillocationColor,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            Text(
                                                'KM ${model.data?[i].distance}',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: shopDetailKmColor)),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 8,
                                              width: 8,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      shopDetaillocationColor),
                                            ),
                                            SizedBox(
                                              width: 6.0,
                                            ),
                                            Text(
                                                model.data?[i].isOpen == true
                                                    ? 'open'
                                                    : "close",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: shopDetailKmColor)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LatLng(double.parse(model.data![i].lat.toString()),
                                double.parse(model.data![i].long.toString())),
                          );
                          if (shopId == model.data![i].id.toString()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopDetails(
                                        shopID: model.data![i].id.toString())));
                          }

                          shopId = model.data![i].id.toString();

                          // infoWindow:
                          // _customInfoWindowController.hideInfoWindow!();
                        },
                        markerId: MarkerId('${model.data?[i].id}'),
                        // infoWindow:
                        //     InfoWindow(title: 'I am a marker', onTap: () {}),
                        // icon: model.data![i].isSpecial == 0
                        //     ? customIcon
                        //     : customIcon,
                        position: LatLng(
                            double.parse(model.data![i].lat.toString()),
                            double.parse(model.data![i].long.toString()))));
                  });
                  // markers.clear();

                  // setState(() {});
                }

                // _observe = true;

              }
            })
          ],
          child: Stack(
            children: <Widget>[
              Stack(
                children: [
                  GoogleMap(
                      mapType: MapType.normal,
                      onTap: (position) {
                        _customInfoWindowController.hideInfoWindow!();
                      },
                      onCameraMove: (position) {
                        _customInfoWindowController.onCameraMove!();
                      },
                      onMapCreated: _onMapCreated,
                      markers: Set<Marker>.of(markers),
                      initialCameraPosition: _kGooglePlex),
                  CustomInfoWindow(
                    controller: _customInfoWindowController,
                    height: 50,
                    width: 150,
                    offset: 50,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // height: 50,
                      width: 282,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      child: TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                              // textDirection: _textDirection,
                              // onChanged: _onChange,
                              controller: _searchController,
                              focusNode: _focusNode,
                              style: const TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    // color: homeCard,

                                    borderRadius: BorderRadius.circular(13)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(13)),
                                // border: InputBorder,
                                prefix: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    'assets/images/Search.png',
                                    // color: Colors.red,
                                  ),
                                ),
                                // suffixIcon: _focusNode.hasFocus
                                //     ? IconButton(
                                //         onPressed: _clearBtnTap,
                                //         icon: const Icon(Icons.close,
                                //             color: Colors.black))
                                // : const SizedBox(),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 16),
                                hintText: 'search',
                                hintStyle: const TextStyle(color: textColor),
                                filled: true,
                                fillColor: Theme.of(context).cardColor,
                                // enabledBorder: OutlineInputBorder(
                                //     borderRadius:
                                //         BorderRadius.circular(4),
                                //     borderSide: BorderSide(
                                //         color: Theme.of(context)
                                //             .unselectedWidgetColor)),
                                // focusedBorder: OutlineInputBorder(
                                //     borderRadius:
                                //         BorderRadius.circular(4),
                                //     borderSide: BorderSide(
                                //         color: Theme.of(context)
                                //             .unselectedWidgetColor))
                              )),
                          noItemsFoundBuilder: (BuildContext context) =>
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: Text('no result',
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontSize: 16.0))),
                          minCharsForSuggestions: 1,
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                              // borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context).cardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              clipBehavior: Clip.hardEdge),
                          suggestionsCallback: HomeCubit().suggestSearch,
                          itemBuilder: (context, String text) {
                            return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Row(children: [
                                  // const Icon(Icons.location_on),
                                  // const SizedBox(width: 8),
                                  Expanded(
                                      child: Text(text,
                                          style: const TextStyle(fontSize: 14)))
                                ]));
                          },
                          onSuggestionSelected: _onSuggestionSelected),
                      // defaulttextfield(
                      //     controller: search,
                      //     type: TextInputType.text,
                      //     hinttext: 'search',
                      //     onsmuit: (value) {
                      //       print(value);
                      //       HomeCubit.get(context).suggestSearch(
                      //           search: 'tt', lat: '', long: '');
                      //     },
                      //     prefix: Icons.search),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 51,
                      decoration: BoxDecoration(
                          color: button1color,
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      child: Image.asset(
                        'assets/images/filter.png',
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _clearBtnTap() {
    setState(() {
      _focusNode.unfocus();
      _searchController.clear();
    });
  }

  void _onSuggestionSelected(String suggestion) {
    setState(() {
      _searchController.text = suggestion;
      print("current :: $_locations");
      for (int i = 0;
          i < HomeCubit.get(context).updateMapModel!.data!.length;
          i++) {
        if (HomeCubit.get(context)
                .updateMapModel!
                .data![i]
                .translations
                ?.first
                .name ==
            suggestion) {
          double latitude = double.tryParse(
              HomeCubit.get(context).updateMapModel!.data![i].lat.toString())!;
          double longitude = double.tryParse(
              HomeCubit.get(context).updateMapModel!.data![i].long.toString())!;

          // CacheHelper.saveData(key: "myLat", value: latitude.toString());
          // CacheHelper.saveData(key: "myLong", value: longitude.toString());

          latlong = '$latitude,$longitude';
          // storage.write(key: "myLatLong", value: latlong);
          print(latlong);
          mapController.animateCamera(
              CameraUpdate.newLatLng(LatLng(latitude, longitude)));
          // markers.clear();
          // markers.add(Marker(
          //     markerId: const MarkerId('currentLocation'),
          //     position: LatLng(latitude, longitude)));
          // searchLocation = HomeCubit.get(context).updateMapModel!.data![i] as UpdateMapModel?;
          mapLocation = null;
        }
      }
    });
  }

  // void _onSuggestionSelected(String suggestion) {
  //   setState(() {
  //     _searchController.text = suggestion;
  //     _currentAddress = suggestion;

  //     // print("current :: $_locations");
  //     for (var element in _locations) {
  //       // if (element.translations?.first.name == suggestion) {
  //       double latitude = double.tryParse(element.lat!)!;
  //       double longitude = double.tryParse(element.long!)!;

  //       CacheHelper.saveData(key: "myLat", value: latitude.toString());
  //       CacheHelper.saveData(key: "myLong", value: longitude.toString());

  //       latlong = '$latitude,$longitude';
  //       // storage.write(key: "myLatLong", value: latlong);
  //       print(latlong);
  //       mapController
  //           .animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
  //       markers.clear();
  //       markers.add(Marker(
  //           markerId: const MarkerId('currentLocation'),
  //           position: LatLng(latitude, longitude)));
  //       // searchLocation = element;
  //       // mapLocation = null;
  //       // }
  //     }
  //   });
  // }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    _customInfoWindowController.googleMapController = controller;
    _controller.complete(controller);
    // if (widget.getLocation == true) {
    Position position = await _determinePosition();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 5.5)));
    _getAddressFromLatLng(LatLng(position.latitude, position.longitude));
    setState(() {
      _currentlat = position.latitude;
      _currentlong = position.longitude;
      latlong = '$_currentlat,$_currentlong';
      // storage.write(key: "myLatLong", value: latlong);
    });

    // markers.clear();
    markers.add(Marker(
        markerId: const MarkerId("currentPinn"),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(position.latitude, position.longitude)));

    print(latlong);
    // }
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    await placemarkFromCoordinates(latLng.latitude, latLng.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = ' ${place.subAdministrativeArea}';
        // counrty = place.country.toString();
        // city = place.subAdministrativeArea.toString();
        // street = place.street.toString();

        // searchLocation = null;
        // mapLocation = LocationModel(
        //     id: 080900100,
        //     name: _currentAddress,
        //     latLong: "${latLng.latitude},${latLng.longitude}");
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

// Test if location services are enabled.

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      // serviceEnabled = true;
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return Geolocator.getCurrentPosition();
  }

  void _observeLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 50,
      // timeLimit: Duration(seconds: 10),
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      _currentLocation = LatLng(position.latitude, position.longitude);
      print('1');

      _homeCubit.updateMap(
          lat: '${position.latitude}', long: '${position.longitude}');

      setState(() {});
    });
  }
}
