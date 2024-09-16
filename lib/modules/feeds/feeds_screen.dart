import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/_cubit.dart';
import 'package:social_app/layout/cubit/_state.dart';
import 'package:social_app/models/post_model.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        print(SocialCubit.get(context).posts.isNotEmpty);
        print(SocialCubit.get(context).userModel != null);
        print('========================CHECKING========================');
      },
      builder: (context, state) {
        return
          SocialCubit.get(context).posts.isNotEmpty &&
                SocialCubit.get(context).userModel != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      margin: EdgeInsets.all(8),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/cheerful-positive-young-european-woman-with-dark-hair-broad-shining-smile-points-with-thumb-aside_273609-18325.jpg?t=st=1723702943~exp=1723706543~hmac=864592c4825f2002a7e1b81a79a0c955bafcf99a9b3a9fdc8cdac6ac4967d77b&w=1060'),
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'communicate with friends',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildPostItem(
                        SocialCubit.get(context).posts[index],
                        context,
                        index,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount: SocialCubit.get(context).posts.length,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget buildPostItem(PostModel model, context, index) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      '${model.imageProfile}',
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${model.name}',
                              style: const TextStyle(
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.check_circle,
                              size: 16,
                              color: Colors.deepPurpleAccent,
                            ),
                          ],
                        ),
                        Text(
                          '${model.dateTime}',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 1.4,
                                  ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 16,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                '${model.text}',
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 5,
              //     bottom: 10,
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     child: Wrap(
              //       children: [
              //         Container(
              //           height: 20,
              //           padding: const EdgeInsetsDirectional.only(end: 6),
              //           child: MaterialButton(
              //             minWidth: 1,
              //             padding: EdgeInsets.zero,
              //             child: const Text(
              //               '#software',
              //               style: TextStyle(
              //                 color: Colors.deepPurpleAccent,
              //               ),
              //             ),
              //             onPressed: () {},
              //           ),
              //         ),
              //         Container(
              //           height: 20,
              //           padding: const EdgeInsetsDirectional.only(end: 6),
              //           child: MaterialButton(
              //             minWidth: 1,
              //             padding: EdgeInsets.zero,
              //             child: const Text(
              //               '#flutter',
              //               style: TextStyle(
              //                 color: Colors.deepPurpleAccent,
              //               ),
              //             ),
              //             onPressed: () {},
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              if (model.postImage != '')
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${model.postImage}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${SocialCubit.get(context).likes[index]}',
                                // 'test like',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      height: 1.4,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.comment_outlined,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                // '${SocialCubit.get(context).commentsNum[index]} comment',
                                '000 comment',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      height: 1.4,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    //==
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              '${SocialCubit.get(context).userModel!.imageProfile}',
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'write a comment ...',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(),
                          )
                        ],
                      ),
                      onTap: () {
                        // SocialCubit.get(context).commentPost(
                        //     SocialCubit.get(context).postsId[index], 'comment');
                        // print(SocialCubit.get(context).commentsNum[index]);
                        // print('=======================================');
                      },
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Like',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 1.4,
                                  ),
                        ),
                      ],
                    ),
                    onTap: () {
                      print(SocialCubit.get(context).likes[index]);
                      SocialCubit.get(context)
                          .likePost(SocialCubit.get(context).postsId[index]);
                    },
                  ),
                  //==
                ],
              )
            ],
          ),
        ),
      );
}
