// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// // import 'addproduct.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:healthplus/NearByLab/adddetails.dart';
//
// class LocationPage extends StatefulWidget {
//   const LocationPage({Key? key}) : super(key: key);
//
//   @override
//   State<LocationPage> createState() => _LocationPageState();
// }
//
// class _LocationPageState extends State<LocationPage> {
//   String? _currentAddress;
//   Position? _currentPosition;
//   //late String tet="press icon to select location";
//
//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location services are disabled. Please enable the services')));
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Location permissions are denied')));
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location permissions are permanently denied, we cannot request permissions.')));
//       return false;
//     }
//     return true;
//   }
//
//   Future<void> _getCurrentPosition() async {
//     final hasPermission = await _handleLocationPermission();
//
//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//       _getAddressFromLatLng(_currentPosition!);
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }
//
//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(
//         _currentPosition!.latitude, _currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress =
//         ' ${place.name},${place.subLocality},${place.locality},${place.subAdministrativeArea} ${place.country}, ${place.postalCode}';
//         //tet=_currentAddress!;
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Choose Your Loaction"),
//         backgroundColor:Colors.teal,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
// //margin: const EdgeInsets.all(10),
//                 padding: const EdgeInsets.all(10),
// // height: 200,
// // color: Colors.amberAccent,
//                 height: MediaQuery.of(context).size.height *(1/4),
//                 width: MediaQuery.of(context).size.height *double.infinity,
//                 decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.teal),borderRadius: BorderRadius.circular(30),color: Colors.teal[50]),
//
//
//                 child: SingleChildScrollView(
//                   child: Column(
// //mainAxisAlignment: MainAxisAlignment.center,
//
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       SizedBox(height: 10,),
//                       Text(
//                         "Location    : ${_currentAddress ?? ""}",
//                         style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,fontWeight: FontWeight.bold,),
//                       ),
//
//
//
//
//
//
//
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//               const SizedBox(height: 32),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal
//                 ),
//                 onPressed: _getCurrentPosition,
//                 child: const Text("Get Current Location"),
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal
//                 ),
//                 onPressed: (){
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) =>AddDetails(txt:_currentAddress!,)),
//                   );
//                 },
//                 child: const Text("Go back to Add page"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }