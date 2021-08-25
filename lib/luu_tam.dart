// strKhachHang = await postKhachHang(
// emailInput.toString(),
// nameInput.toString(),
// addressInput.toString(),
// sdtInput.toString(),
// ).then((value){
// strKhachHang = value;
// });
//
// if (strKhachHang.isEmpty){
//
// }else{

// final df = new DateFormat('dd-MM-yyyy hh:mm a');
// DateTime date = DateTime.now();
// String strNow = df.format(date);
//
// DateTime newDate = new DateTime(date.year, date.month, date.day+7);
// String strGiao = df.format(newDate);
// String strDonHang = await postDonDatHang(
//     strNow,
//   strGiao,
//     strKhachHang,
// );
//
// if (strDonHang.isEmpty){
//
// }else{
//   String strChitietDonHang="";
//   for (var index =0; index<= cart.itemCount ; index++){
//         strChitietDonHang = await postChiTietDonDatHang(
//         strDonHang,
//         cart.items.values.toList()[index].id,
//         cart.items.values.toList()[index].title,
//         "${cart.items.values.toList()[index].quantity}",
//         "${ cart.items.values.toList()[index].quantity*cart.items.values.toList()[index].price}",
//     );
//   }
//
//   if(strChitietDonHang.isEmpty){
//
//   }else{
//
//   }
// }


//}