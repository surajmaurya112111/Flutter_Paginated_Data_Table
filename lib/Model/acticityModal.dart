// To parse this JSON data, do
//
//     final activityListModel = activityListModelFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

ActivityListModel activityListModelFromJson(String? str) =>
    ActivityListModel.fromJson(json.decode(str!));

@JsonSerializable()
class ActivityListModel {
  int status;
  int count;
  int today;
  int past;
  int future;
  String? members;
  List<Datum> data;

  ActivityListModel({
    required this.status,
    required this.count,
    required this.today,
    required this.past,
    required this.future,
    required this.data,
    required this.members,
  });

  factory ActivityListModel.fromJson(Map<String?, dynamic> json) =>
      ActivityListModel(
        status: json["status"],
        count: json["count"],
        today: json["today"],
        past: json["past"],
        future: json["future"],
        members: json['memberFirst'],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  String? id;
  String? opportunityId;
  String? issueId;
  String? homeId;
  String? roomId;
  dynamic bedId;
  dynamic activityId;
  String? activityType;
  String? activityDescription;
  bool todo;
  bool completed;
  String? todoOwner;
  String? todoDate;
  bool meeting;
  String? meetingDate;
  dynamic meetingLocation;
  dynamic vendorId;
  dynamic vendorName;
  dynamic email;
  dynamic from;
  dynamic to;
  dynamic subject;
  dynamic body;
  bool recurring;
  dynamic frequency;
  dynamic startDate;
  dynamic endDate;
  String? createdDate;
  String? operatorId;
  String? createdBy;
  dynamic messageId;
  dynamic emailTrackingId;
  dynamic useCommunity;
  dynamic waConversationId;
  dynamic useSales;
  dynamic useRe;
  int isVisible;
  dynamic emailcc;
  dynamic emailTo;
  dynamic recurringServiceId;
  dynamic useAdmin;
  String? reProposalId;
  String? referenceId;
  String? referenceType;
  String? homeName;
  String? roomName;
  String? todoOwnerName;
  String? todoOwnerPicture;
  String? createdByName;
  List<Member> members;

  Datum({
    required this.id,
    required this.opportunityId,
    this.issueId,
    required this.homeId,
    this.roomId,
    this.bedId,
    this.activityId,
    required this.activityType,
    required this.activityDescription,
    required this.todo,
    required this.completed,
    required this.todoOwner,
    required this.todoDate,
    required this.meeting,
    this.meetingDate,
    this.meetingLocation,
    this.vendorId,
    this.vendorName,
    this.email,
    this.from,
    this.to,
    this.subject,
    this.body,
    required this.recurring,
    this.frequency,
    this.startDate,
    this.endDate,
    required this.createdDate,
    required this.operatorId,
    required this.createdBy,
    this.messageId,
    this.emailTrackingId,
    this.useCommunity,
    this.waConversationId,
    this.useSales,
    this.useRe,
    required this.isVisible,
    this.emailcc,
    this.emailTo,
    this.recurringServiceId,
    this.useAdmin,
    this.reProposalId,
    this.referenceId,
    this.referenceType,
    required this.homeName,
    this.roomName,
    required this.todoOwnerName,
    required this.todoOwnerPicture,
    required this.createdByName,
    required this.members,
  });

  factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
        id: json["id"],
        opportunityId: json["opportunityId"],
        issueId: json["issueId"],
        homeId: json["homeId"],
        roomId: json["roomId"],
        bedId: json["bedId"],
        activityId: json["activityId"],
        activityType: json["activityType"],
        activityDescription: json["activityDescription"],
        todo: json["todo"],
        completed: json["completed"],
        todoOwner: json["todoOwner"],
        todoDate: json["todoDate"],
        meeting: json["meeting"],
        meetingDate: json["meetingDate"],
        meetingLocation: json["meetingLocation"],
        vendorId: json["vendorId"],
        vendorName: json["vendorName"],
        email: json["email"],
        from: json["from"],
        to: json["to"],
        subject: json["subject"],
        body: json["body"],
        recurring: json["recurring"],
        frequency: json["frequency"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        createdDate: json["createdDate"],
        operatorId: json["operatorId"],
        createdBy: json["createdBy"],
        messageId: json["messageId"],
        emailTrackingId: json["emailTrackingId"],
        useCommunity: json["useCommunity"],
        waConversationId: json["waConversationId"],
        useSales: json["useSales"],
        useRe: json["useRE"],
        isVisible: json["isVisible"],
        emailcc: json["emailcc"],
        emailTo: json["emailTo"],
        recurringServiceId: json["recurringServiceId"],
        useAdmin: json["useAdmin"],
        reProposalId: json["reProposalId"],
        referenceId: json["referenceId"],
        referenceType: json["referenceType"],
        homeName: json["homeName"],
        roomName: json["roomName"],
        todoOwnerName: json["todoOwnerName"],
        todoOwnerPicture: json["todoOwnerPicture"],
        createdByName: json["createdByName"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "opportunityId": opportunityId,
        "issueId": issueId,
        "homeId": homeId,
        "roomId": roomId,
        "bedId": bedId,
        "activityId": activityId,
        "activityType": activityType,
        "activityDescription": activityDescription,
        "todo": todo,
        "completed": completed,
        "todoOwner": todoOwner,
        "todoDate": todoDate,
        "meeting": meeting,
        "meetingDate": meetingDate,
        "meetingLocation": meetingLocation,
        "vendorId": vendorId,
        "vendorName": vendorName,
        "email": email,
        "from": from,
        "to": to,
        "subject": subject,
        "body": body,
        "recurring": recurring,
        "frequency": frequency,
        "startDate": startDate,
        "endDate": endDate,
        "createdDate": createdDate,
        "operatorId": operatorId,
        "createdBy": createdBy,
        "messageId": messageId,
        "emailTrackingId": emailTrackingId,
        "useCommunity": useCommunity,
        "waConversationId": waConversationId,
        "useSales": useSales,
        "useRE": useRe,
        "isVisible": isVisible,
        "emailcc": emailcc,
        "emailTo": emailTo,
        "recurringServiceId": recurringServiceId,
        "useAdmin": useAdmin,
        "reProposalId": reProposalId,
        "referenceId": referenceId,
        "referenceType": referenceType,
        "homeName": homeName,
        "roomName": roomName,
        "todoOwnerName": todoOwnerName,
        "todoOwnerPicture": todoOwnerPicture,
        "createdByName": createdByName,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}

class Member {
  String? memberEmail;
  String? memberFirst;
  String? memberLast;
  String? memberPhone;
  String? memberWhatsapp;
  String? memberId;
  String? preferredName;
  String? memberType;
  String? type;

  Member({
    required this.memberEmail,
    required this.memberFirst,
    required this.memberLast,
    required this.memberPhone,
    required this.memberWhatsapp,
    required this.memberId,
    required this.preferredName,
    required this.memberType,
    required this.type,
  });

  factory Member.fromJson(Map<String?, dynamic> json) => Member(
        memberEmail: json["memberEmail"],
        memberFirst: json["memberFirst"],
        memberLast: json["memberLast"],
        memberPhone: json["memberPhone"],
        memberWhatsapp: json["memberWhatsapp"],
        memberId: json["memberId"],
        preferredName: json["preferredName"],
        memberType: json["memberType"],
        type: json["type"],
      );

  Map<String?, dynamic> toJson() => {
        "memberEmail": memberEmail,
        "memberFirst": memberFirst,
        "memberLast": memberLast,
        "memberPhone": memberPhone,
        "memberWhatsapp": memberWhatsapp,
        "memberId": memberId,
        "preferredName": preferredName,
        "memberType": memberType,
        "type": type,
      };
}
