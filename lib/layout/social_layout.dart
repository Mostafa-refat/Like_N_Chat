import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/_cubit.dart';
import 'package:social_app/layout/cubit/_state.dart';
import 'package:social_app/modules/new_post/new_post_screen.dart';
import 'package:social_app/modules/notifications/notifications_screen.dart';
import 'package:social_app/modules/search/search_screen.dart';
import 'package:social_app/shared/components/components.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is SocialNewPostState){
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, const NotificationsScreen());
              }, icon: const Icon(Icons.notifications)),
              IconButton(onPressed: (){
                navigateTo(context, const SearchScreen());
              }, icon: const Icon(Icons.search)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepPurpleAccent,
            showUnselectedLabels: true,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chats'),
              BottomNavigationBarItem(icon: Icon(Icons.post_add_outlined),label: 'Post'),
              BottomNavigationBarItem(icon: Icon(Icons.location_on),label: 'Users'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
