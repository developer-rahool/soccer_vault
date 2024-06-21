// import 'package:flutter/material.dart';
// import '../models/tournament_by_countries_model.dart';

// class CountriesListPopup extends StatefulWidget {
//   CountryTournamentData? data;
//   CountriesListPopup({super.key, this.data});

//   @override
//   State<CountriesListPopup> createState() => _CountriesListPopupState();
// }

// class _CountriesListPopupState extends State<CountriesListPopup> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const Text('Tournament: ',
//                     style:
//                         TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//                 Text(widget.data!.id.toString(),
//                     style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         overflow: TextOverflow.ellipsis)),
//               ],
//             ),
//           ],
//         ),
//         const Row(
//           children: [
//             Text('Countries: ',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//           ],
//         ),
//         ListTile(
//           // title: Text('${widget.data!.id}'),
//           subtitle: Text(widget.data!.teams?.join(', ') ?? '',
//               style:
//                   const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//       ],
//     );
//   }
// }
