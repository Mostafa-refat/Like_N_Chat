import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/_cubit.dart';
import 'package:social_app/layout/cubit/_state.dart';
import 'package:social_app/models/message_model.dart';
import 'package:social_app/models/user_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  UserModel? userReceiverModel;

  ChatDetailsScreen({super.key, required this.userReceiverModel});

  var messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.get(context)
            .getMessages(receiverId: userReceiverModel!.uId!);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        '${userReceiverModel!.imageProfile}',
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${userReceiverModel!.name}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              body:
              // SocialCubit.get(context).messages.isNotEmpty
                  // ?
              Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index){
                                var message = SocialCubit.get(context).messages[index];
                                // print(SocialCubit.get(context).messages[index].dateTime);
                                // print(SocialCubit.get(context).messages[index].text);
                                // print("MESSAGE TIME ============================");
                                if(SocialCubit.get(context).userModel!.uId == message.senderId)
                                  return buildMyMessage(message);

                                  return buildMessage(message);
                              },
                              separatorBuilder: (context, index) => const SizedBox(height: 15,),
                              itemCount: SocialCubit.get(context).messages.length,
                            ),
                          ),
                          //
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: messageController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Type your message here ...',
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  color: Colors.deepPurpleAccent,
                                  child: MaterialButton(
                                    minWidth: 1,
                                    onPressed: () {
                                      SocialCubit.get(context).sendMessage(
                                        receiverId: userReceiverModel!.uId!,
                                        dateTime: DateTime.now().toString(),
                                        text: messageController.text,
                                      );
                                      // print(DateTime.now().toString());
                                      // Print("TIME OF MY MESSAGE ==================");
                                    },
                                    child: const Icon(
                                      Icons.send_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  // : const Center(
                  //     child: CircularProgressIndicator(),
                  //   ),
            );
          },
        );
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text(
            model.text!,
          ),
        ),
      );
  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.withOpacity(.3),
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text(
            model.text!,
          ),
        ),
      );
}
