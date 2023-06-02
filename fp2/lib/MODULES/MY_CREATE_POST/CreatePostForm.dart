import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service_layer_stub/models/Movie.dart';
import '../../service_layer_stub/models/MyPost.dart';
import '../../service_layer_stub/models/Series.dart';
import '../../service_layer_stub/models/Songs.dart';
import '../../service_layer_stub/models/YoutubeModel.dart';
import '../My_BottomBar_stub/my_chips2_logic/my_chips2_bloc.dart';
import '../myComponents.dart';

class CreatePostForm extends StatefulWidget {
  final headingText;
  final api_id;
  final loved_fact_text;
  const CreatePostForm({
    required this.headingText,
    required this.api_id,
    required this.loved_fact_text,
  });

  @override
  _CreatePostFormState createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  final formKey1 = GlobalKey<FormState>();
/* -------------------------------------------------------------------------- */
/*                               //@ Controllers                              */
/* -------------------------------------------------------------------------- */

  // TextEditingController lovedFact_controller = TextEditingController();
  // TextEditingController message_controller = TextEditingController();

/* -------------------------------------------------------------------------- */
/*                                  //@ build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return myBody();
  }

  myBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
      child: Container(
        child: Form(
          key: formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10),
              // aboutIdeaCard(),
              // SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: createPostButton(),
              )
            ],
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                               //! Save button                              */
/* -------------------------------------------------------------------------- */

  createPostButton() {
    return BlocBuilder<MyChips2Bloc, MyChips2State>(
      builder: (context, state) {
        return Container(
          child: TextButton(
            onPressed: () {
              if (formKey1.currentState!.validate()) {
                // MyPost myPost = MyPost(
                //     profile_fk: Profile_sp_repo.get_profile()!.p_uid!,
                //     api_id: widget.api_id,
                //     trendType: widget.headingText,
                //     watchedAt: '2023',
                //     message: 'empty',
                //     lovedFact: widget.loved_fact_text,
                //     createdAt: DateTime.now().toString());

                // BlocProvider.of<MyPostCudBloc>(context)
                //     .add(MyPost_create_onButtonPressed_Event(myPost));
              }
            },
            child: Text("Save", style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                textStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                fixedSize: Size(287, 60)
                // ,backgroundColor: Colors.pink[600]
                ),
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(154, 154, 154, 0.2),
                    blurRadius: 50,
                    offset: Offset(0, 12)),
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  (state is SongChipOpened_State)
                      ? Color(0xffFE8DAF)
                      : (state is MoviesChipOpened_State)
                          ? Color(0xff8FE5FC)
                          : (state is YoutubeChipOpened_State)
                              ? Color(0xffFFD199)
                              : (state is CustomChipOpened_State)
                                  ? Color(0xff5FF8D5)
                                  : Color(0xffFE8DAF),
                  (state is SongChipOpened_State)
                      ? Color(0xffF6608D)
                      : (state is MoviesChipOpened_State)
                          ? Color(0xff47C7EB)
                          : (state is YoutubeChipOpened_State)
                              ? Color(0xffFEB25A)
                              : (state is CustomChipOpened_State)
                                  ? Color(0xff33DCB4)
                                  : Color(0xffF6608D),
                ],
              ),
              borderRadius: BorderRadius.circular(15)),
        );
      },
    );
  }

  // createPostButton() {
  //   return SizedBox(
  //     width: MyComponents.screenSize(context).width * 0.5,
  //     child: TextButton(
  //       style: TextButton.styleFrom(
  //         padding: EdgeInsets.all(0),

  //         // side: BorderSide(width: 2.0, color: Colors.deepPurpleAccent,
  //         // ),
  //         // backgroundColor: Color.fromARGB(255, 15, 0, 68),
  //       ),
  //       onPressed: () {
  //         if (formKey1.currentState!.validate()) {
  //           MyPost myPost = MyPost(
  //               profile_fk: Profile_sp_repo.get_profile()!.p_uid!,
  //               api_id: widget.api_id,
  //               trendType: widget.headingText,
  //               watchedAt: '2023',
  //               message: message_controller.text,
  //               lovedFact: lovedFact_controller.text,
  //               createdAt: DateTime.now().toString());

  //           BlocProvider.of<MyPostCudBloc>(context)
  //               .add(MyPost_create_onButtonPressed_Event(myPost));
  //         }
  //       },
  //       child: Container(
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10.0),
  //             gradient: LinearGradient(colors: [
  //               // Color.fromARGB(255, 45, 2, 202),
  //               // Color.fromARGB(255, 45, 2, 202),
  //               Color.fromARGB(255, 29, 0, 90),
  //               Color.fromARGB(255, 15, 1, 46),

  //               // Color.fromARGB(255, 45, 2, 202),
  //               // Color.fromARGB(255, 26, 0, 119),
  //             ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
  //         //   Color.fromARGB(255, 49, 0, 155),
  //         //   Color.fromARGB(255, 13, 0, 59),
  //         // ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
  //         child: SizedBox(
  //           width: MyComponents.screenSize(context).width,
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 18),
  //             child: Text(
  //               "Create Post",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 14, color: Colors.white
  //                   // color: Color.fromARGB(255, 18, 0, 68),
  //                   ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // createPostButton() {
  //   return SizedBox(
  //     width: MyComponents.screenSize(context).width * 0.75,
  //     child: TextButton(
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           "Create Post",
  //           style: TextStyle(
  //               color: Color(0xff08003C), fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       style: TextButton.styleFrom(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           backgroundColor: Colors.white),
  //       onPressed: () {
  //         Post post = Post(
  //             title: title_controller.text,
  //             description: description_controller.text,
  //             salary_method: salaryMethod_controller.text,
  //             goals: goals_controller.text,
  //             qualifications_req: qualifications_req_controller.text,
  //             skills_req: skills_req_controller.text,
  //             max_users: int.tryParse(maxUsers_controller.text)!,
  //             isOpen: true,
  //             isCompanyRegistered: true,
  //             recordDate: DateTime.now().toString(),
  //             post_fk: Profile_sp_repo.get_profile()!.p_uid);

  //         BlocProvider.of<MyPostCudBloc>(context)
  //             .add(Post_create_onButtonPressed_Event(post));

  //         BlocProvider.of<MyPostsFetchBloc>(context)
  //             .add(MyPosts_Fetch_onInit_Event());
  //       },
  //     ),
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                             //@ About Idea Card                            */
/* -------------------------------------------------------------------------- */

  aboutIdeaCard() {
    return SizedBox(
        width: MyComponents.screenSize(context).width,
        child: Container(
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     gradient: LinearGradient(colors: [
          //       Color.fromARGB(255, 189, 158, 255),
          //       Color.fromARGB(255, 45, 2, 202),
          //     ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(children: [
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "About Idea",
              //     // maxLines: 2,
              //     // overflow: TextOverflow.ellipsis,
              //     // textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Colors.white,
              //       // decoration: TextDecoration.none,
              //       // fontStyle: FontStyle.italic,
              //       // fontFamily: "FontNameHere" ,
              //       fontWeight: FontWeight.bold,
              //       // fontWeight: FontWeight.w300,
              //       fontSize: 18.0,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
                child: Column(
                  children: [
                    customTextFieldUi(widget.headingText,
                        'One thing you loved about this', Icons.favorite),
                    // customTextFieldUi(
                    //     message_controller, 'Note to others', Icons.message),
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  customTextFieldUi(
    controllerArg,
    String labelTextArg,
    IconData icon, {
    bool isKbNumber = false,
  }) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            child: TextFormField(
              style: TextStyle(fontSize: 15),
              controller: controllerArg,
              keyboardType:
                  isKbNumber ? TextInputType.number : TextInputType.multiline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field required'; //if empty give error msg here
                }
                return null;
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    icon,
                    size: 20,
                  ),
                  border: OutlineInputBorder(),
                  labelText: labelTextArg, //hint text here
                  labelStyle: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
          ),
          SizedBox(
            height: 10,
            //height : dimVar.height*0.04
          ),
        ],
      ),
    );
  }
}
