import 'package:apicallusingbloc/blocs/app_bloc.dart';
import 'package:apicallusingbloc/model/UserModelClass.dart';
import 'package:apicallusingbloc/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
          create: (context) => UserRepository(),
          child: Home()
      ),
      // home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Get Api - BLOC'),
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is UserLoadedState){
              List<UserModelClass> userList = state.users;
              return GridView.builder(
                itemCount: userList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0
                  ),
                  itemBuilder: (context, index){
                    var domain = userList[index].webPages;
                    var str = domain!.join("");

                    void _launchURl(String strLink) async{
                      await canLaunchUrl(Uri.parse(strLink)) ? await launchUrl(Uri.parse(strLink)) : throw 'Counld not launch';
                    }

                    return Container(
                      //height: MediaQuery.of(context).size.height * 0.4,
                      //width: MediaQuery.of(context).size.width * 0.1,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userList[index].name.toString(), style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),),
                              Text('Country: ${userList[index].country.toString()}', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),
                              Text('Alpha-Code: ${userList[index].alphaTwoCode.toString()}', style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),),
                            ],
                          ),
                          InkWell(
                            onTap: () async {

                              if(!await launchUrl(Uri.parse(str), mode: LaunchMode.externalApplication)){
                                throw "Count not launch";
                              }

                              //_launchURl(str);\
                              // if(await canLaunchUrl(Uri.parse(str))){
                              //   await launchUrlString(str);
                              // }
                              // if(await canLaunch(str)){
                              //   await launch(str);
                              // }
                              //BlocProvider.of<UserBloc>(context).add(OpenUrlEvent(url: str));
                              //context.read<UserBloc>().add(OpenUrlEvent(url: str));
                              // if(await canLaunchUrl(Uri.parse(str))){
                              //   await launchUrl(Uri.parse(str));
                              // }else{
                              //   throw "Count not launch";
                              // }
                            },
                            child: Text('Website: $str', style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ],
                      ),

                    );
              }
              );
              // return ListView.builder(
              //   itemCount: userList.length,
              //     itemBuilder: (context, index){
              //     //print(userList[index].firstName);
              //       //var domain = userList[index].domains;
              //       var domain = userList[index].webPages;
              //       var str = domain!.join("");
              //     return Card(
              //       //color: Colors.blueAccent,
              //       elevation: 4,
              //       margin: const EdgeInsets.symmetric(vertical: 10),
              //       child: ListTile(
              //         title: Text('Name: ${userList[index].name.toString()}'),
              //         subtitle: Text('Country: ${userList[index].country.toString()}'),
              //         //trailing: Text('Web: ${userList[index].webPages}'),
              //         trailing: Text(str),
              //       ),
              //     );
              //     }
              // );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

