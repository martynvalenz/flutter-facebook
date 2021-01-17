import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({Key key, @required this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 288
      ),
      child:Column(
        children: [
          Row(
            children:[
              Expanded(
                child:Text(
                  'Contacts',
                  style:TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  )
                )
              ),
              const SizedBox(width: 8),
              Icon(Icons.search,color:Colors.grey[600]),
            ]
          ),
          Expanded(
            child: ListView.builder(
              padding:const EdgeInsets.symmetric(vertical: 10),
              itemCount:users.length,
              itemBuilder:(BuildContext context, int index){
                final User user = users[index];
                return Padding(
                  padding:const EdgeInsets.symmetric(vertical: 8),
                  child:UserCard(user:user)
                );
              }
            ),
          )
        ],
      )
    );
  }
}