import 'dart:convert';
import 'package:apicallusingbloc/model/UserModelClass.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  // String endPoint = 'http://universities.hipolabs.com/search?country=United+States';
  // Future<List<UserModel>> getUser() async{
  //     //Response response = await get(Uri.parse(endPoint));
  //     var response = await http.get(Uri.parse(endPoint));
  //     if(response.statusCode == 200){
  //       List<UserModel> result = (jsonDecode(response.body)).map<UserModel>((e) => UserModel.fromJson(e)).toList();
  //       return result;
  //       //final List result = jsonDecode(response.body)['data'];
  //       //return result.map((e) => UserModel.fromJson(e)).toList();
  //     }else{
  //       throw Exception(response.reasonPhrase);
  //     }
  //
  // }
  List<UserModelClass> userList = [];
  
  Future<List<UserModelClass>> getUserApi() async{
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=United+States'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map<String, dynamic> i in data){
        //print(i);
        userList.add(UserModelClass.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
  }



  // Future launchUrl() async {
  //   if(!await launchUrl(Uri.parse(str), mode: LaunchMode.externalApplication)){
  //     throw "Count not launch";
  //   }
  // }
}