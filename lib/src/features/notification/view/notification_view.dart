import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/commons/smivox_inapp_bar.dart';


class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomInAppBar(title: "Notifications"),
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                       child: CommonMethods.appTexts(context, "Today", fontSize: 18, fontWeight: FontWeight.w500),
                   ),
               NotificationItem(notification: "Tamper Attempt Alert", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add), bckgrndColor: Color(0xFFFFD3BD).withOpacity(0.5)),
               NotificationItem(notification: "Paul blocked a Staff", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add), bckgrndColor: Color(0xFFFFD3BD).withOpacity(0.5)),
               NotificationItem(notification: "Low stock Alert (Hans Potato Poundo)", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add), bckgrndColor: Color(0xFFFFD3BD).withOpacity(0.5)),

               const SizedBox(height: 24),

               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                 child: CommonMethods.appTexts(context, "Yesterday", fontSize: 18, fontWeight: FontWeight.w500),
               ),
               NotificationItem(notification: "Tamper Attempt Alert", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add)),
               NotificationItem(notification: "Paul blocked a Staff", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add)),
               NotificationItem(notification: "Paul blocked a Staff", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add)),


               const SizedBox(height: 24),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                 child: CommonMethods.appTexts(context, "May 29", fontSize: 18, fontWeight: FontWeight.w500),
               ),
               NotificationItem(notification: "Tamper Attempt Alert", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add)),
               NotificationItem(notification: "Paul blocked a Staff", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add)),
               NotificationItem(notification: "Paul blocked a Staff", notificationTime: "9:25 AM", widgetIcon: Icon(Icons.add)),


               const SizedBox(height: 45),
             ],
          ),
       ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Widget? widgetIcon;
  final String notification;
  final String notificationTime;
  final Color? bckgrndColor;

  const NotificationItem({
    super.key,
    this.widgetIcon,
    required this.notification,
    required this.notificationTime,
    this.bckgrndColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       color: bckgrndColor,
       child:  Column(
         children: [
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
             child: Row(
               spacing: 20,
               children: [
                 Container(
                   width: 40,
                   height: 40,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(50),
                     color: Color(0xFFBDBDBD).withOpacity(0.5),
                   ),
                   child: widgetIcon!,
                 ),
                 Expanded(
                   child: Column(
                     spacing: 2,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       CommonMethods.appTexts(context, notification, fontSize: 16, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                       CommonMethods.appTexts(context, notificationTime),
                     ],
                   ),
                 )
               ],
             ),
           ),
           Divider(color: Color(0xFFc2c2c2).withOpacity(0.4))
         ],
       ),
    );
  }
}




