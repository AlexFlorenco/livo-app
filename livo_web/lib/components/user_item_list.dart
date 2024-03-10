// import 'package:flutter/material.dart';
// import 'package:livo_app/controllers/livo_table_controller.dart';
// import 'package:livo_app/shared/constants/livo_colors.dart';

// class UserItemList extends StatelessWidget {
//   final String id;
//   final String name;
//   final String email;

//   const UserItemList({
//     super.key,
//     required this.id,
//     required this.name,
//     required this.email,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//                 width: constraints.maxWidth * 0.2,
//                 child: Text(
//                   id,
//                   overflow: TextOverflow.ellipsis,
//                 )),
//             SizedBox(
//               width: constraints.maxWidth * 0.2,
//               child: Text(name),
//             ),
//             SizedBox(
//               width: constraints.maxWidth * 0.2,
//               child: Text(email),
//             ),
//             SizedBox(
//               width: constraints.maxWidth * 0.1,
//               child: Row(
//                 children: [
//                   Container(
//                     width: 32,
//                     height: 32,
//                     decoration: BoxDecoration(
//                         color: LivoColors.mainPrimaryColor,
//                         borderRadius: BorderRadius.circular(6)),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.edit,
//                         size: 18,
//                         color: LivoColors.lightTextColor,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 5),
//                   Container(
//                     width: 32,
//                     height: 32,
//                     decoration: BoxDecoration(
//                         color: LivoColors.dangerColor,
//                         borderRadius: BorderRadius.circular(6)),
//                     child: IconButton(
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text('Confirmação'),
//                               content:
//                                   Text('Tem certeza de que deseja deletar?'),
//                               actions: <Widget>[
//                                 TextButton(
//                                   child: Text('Cancelar'),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                                 TextButton(
//                                   child: Text('Deletar'),
//                                   onPressed: () async {
//                                     await LivoTableController().deleteUser(id);
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       icon: const Icon(
//                         Icons.delete,
//                         size: 18,
//                         color: LivoColors.lightTextColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
