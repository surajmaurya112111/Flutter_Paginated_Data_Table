// To parse this JSON data, do
//
//     final activityDetales = activityDetalesFromJson(jsonString);

import 'dart:convert';

ActivityDetales activityDetalesFromJson(String? str) =>
    ActivityDetales.fromJson(json.decode(str!));

String? activityDetalesToJson(ActivityDetales data) =>
    json.encode(data.toJson());

class ActivityDetales {
  int status;
  Data data;

  ActivityDetales({
    required this.status,
    required this.data,
  });

  factory ActivityDetales.fromJson(Map<String?, dynamic> json) =>
      ActivityDetales(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String? id;
  String? opportunityId;
  dynamic issueId;
  String? homeId;
  String? roomId;
  dynamic bedId;
  dynamic activityId;
  String? activityType;
  String? activityDescription;
  int todo;
  int completed;
  String? todoOwner;
  String? todoDate;
  int meeting;
  dynamic meetingDate;
  dynamic meetingLocation;
  dynamic vendorId;
  dynamic vendorName;
  dynamic email;
  dynamic from;
  dynamic to;
  dynamic subject;
  dynamic body;
  int recurring;
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
  dynamic event;
  dynamic receivedAt;
  dynamic recipient;
  dynamic tag;
  dynamic deliveredAt;
  String? opportunityName;
  List<Member> members;
  List<dynamic> attachments;
  String? homeName;
  String? buildingName;
  String? unitNumber;
  String? address;
  String? mainPicture;
  String? roomName;
  String? todoOwnerName;
  String? todoOwnerPicture;
  String? createdByName;

  Data({
    required this.id,
    required this.opportunityId,
    this.issueId,
    required this.homeId,
    required this.roomId,
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
    required this.reProposalId,
    required this.referenceId,
    required this.referenceType,
    this.event,
    this.receivedAt,
    this.recipient,
    this.tag,
    this.deliveredAt,
    required this.opportunityName,
    required this.members,
    required this.attachments,
    required this.homeName,
    required this.buildingName,
    required this.unitNumber,
    required this.address,
    required this.mainPicture,
    required this.roomName,
    required this.todoOwnerName,
    required this.todoOwnerPicture,
    required this.createdByName,
  });

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
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
        event: json["event"],
        receivedAt: json["receivedAt"],
        recipient: json["recipient"],
        tag: json["tag"],
        deliveredAt: json["deliveredAt"],
        opportunityName: json["opportunityName"],
        // reProposal: ReProposal.fromJson(json["reProposal"]
        // ),
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        homeName: json["homeName"],
        buildingName: json["buildingName"],
        unitNumber: json["unitNumber"],
        address: json["address"],
        mainPicture: json["mainPicture"],
        roomName: json["roomName"],
        todoOwnerName: json["todoOwnerName"],
        todoOwnerPicture: json["todoOwnerPicture"],
        createdByName: json["createdByName"],
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
        "event": event,
        "receivedAt": receivedAt,
        "recipient": recipient,
        "tag": tag,
        "deliveredAt": deliveredAt,
        "opportunityName": opportunityName,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "homeName": homeName,
        "buildingName": buildingName,
        "unitNumber": unitNumber,
        "address": address,
        "mainPicture": mainPicture,
        "roomName": roomName,
        "todoOwnerName": todoOwnerName,
        "todoOwnerPicture": todoOwnerPicture,
        "createdByName": createdByName,
      };
}

class Member {
  String? memberFirst;
  String? memberLast;
  String? memberEmail;
  String? memberId;
  String? phone;
  String? whatsapp;
  String? gender;
  dynamic age;
  String? standardizedJobTitle;
  dynamic image;
  String? preferredName;
  String? memberType;
  String? status;
  String? nationality;

  Member({
    required this.memberFirst,
    required this.memberLast,
    required this.memberEmail,
    required this.memberId,
    required this.phone,
    required this.whatsapp,
    required this.gender,
    this.age,
    required this.standardizedJobTitle,
    this.image,
    required this.preferredName,
    required this.memberType,
    required this.status,
    required this.nationality,
  });

  factory Member.fromJson(Map<String?, dynamic> json) => Member(
        memberFirst: json["memberFirst"],
        memberLast: json["memberLast"],
        memberEmail: json["memberEmail"],
        memberId: json["memberId"],
        phone: json["phone"],
        whatsapp: json["whatsapp"],
        gender: json["gender"],
        age: json["age"],
        standardizedJobTitle: json["standardizedJobTitle"],
        image: json["image"],
        preferredName: json["preferredName"],
        memberType: json["memberType"],
        status: json["status"],
        nationality: json["nationality"],
      );

  Map<String?, dynamic> toJson() => {
        "memberFirst": memberFirst,
        "memberLast": memberLast,
        "memberEmail": memberEmail,
        "memberId": memberId,
        "phone": phone,
        "whatsapp": whatsapp,
        "gender": gender,
        "age": age,
        "standardizedJobTitle": standardizedJobTitle,
        "image": image,
        "preferredName": preferredName,
        "memberType": memberType,
        "status": status,
        "nationality": nationality,
      };
}

class ReProposal {
  String? id;
  String? startDate;
  String? owner;
  String? type;
  String? description;
  dynamic lostReason;
  String? duration;
  String? listingUrl;
  int askingPrice;
  dynamic propertyId;
  String? lastActivityDate;
  String? createdDate;
  String? createdBy;
  String? operatorId;
  dynamic askingCurrency;
  dynamic askingUnit;

  ReProposal({
    required this.id,
    required this.startDate,
    required this.owner,
    required this.type,
    required this.description,
    this.lostReason,
    required this.duration,
    required this.listingUrl,
    required this.askingPrice,
    this.propertyId,
    required this.lastActivityDate,
    required this.createdDate,
    required this.createdBy,
    required this.operatorId,
    this.askingCurrency,
    this.askingUnit,
  });

  factory ReProposal.fromJson(Map<String?, dynamic> json) => ReProposal(
        id: json["id"],
        startDate: json["startDate"],
        owner: json["owner"],
        type: json["type"],
        description: json["description"],
        lostReason: json["lostReason"],
        duration: json["duration"],
        listingUrl: json["listingUrl"],
        askingPrice: json["askingPrice"],
        propertyId: json["propertyId"],
        lastActivityDate: json["lastActivityDate"],
        createdDate: json["createdDate"],
        createdBy: json["createdBy"],
        operatorId: json["operatorId"],
        askingCurrency: json["askingCurrency"],
        askingUnit: json["askingUnit"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "startDate": startDate,
        "owner": owner,
        "type": type,
        "description": description,
        "lostReason": lostReason,
        "duration": duration,
        "listingUrl": listingUrl,
        "askingPrice": askingPrice,
        "propertyId": propertyId,
        "lastActivityDate": lastActivityDate,
        "createdDate": createdDate,
        "createdBy": createdBy,
        "operatorId": operatorId,
        "askingCurrency": askingCurrency,
        "askingUnit": askingUnit,
      };
}
