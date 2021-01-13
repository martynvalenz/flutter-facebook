import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, this.onlineUsers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    
    return Card(
      margin:EdgeInsets.symmetric(horizontal:isDesktop == true ? 5 : 0),
      elevation: isDesktop == true ? 1 : 0,
      shape: isDesktop == true ? 
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ) 
        : null,
      child: Container(
        height:60,
        color:Colors.white,
        child:ListView.builder(
          padding:const EdgeInsets.symmetric(vertical: 10, horizontal:4),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index){
            if(index == 0){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:8),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding:const EdgeInsets.symmetric(horizontal:8),
              child:ProfileAvatar(imageUrl:user.imageUrl, isActive:true)
            );
          }
        )
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed:() => print('create Room'),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      color:Colors.white,
      borderSide: BorderSide(
        width: 3,
        color:Colors.blueAccent[100]
      ),
      textColor: Palette.facebookBlue,
      child:Row(
        children: [
          // ShaderMask(
          //   shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
          //   child: Icon(
          //     Icons.video_call,
          //     size:35,
          //     color:Colors.white
          //   ),
          // ),
          Icon(
            Icons.video_call,
            size:35,
            color:Colors.purple
          ),
          const SizedBox(width:4),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}