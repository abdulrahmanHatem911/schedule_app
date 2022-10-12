import '../../domain/entity/event.dart';

class EventModel extends Event {
  const EventModel({
    required super.id,
    required super.title,
    required super.description,
    required super.spots,
    required super.price,
    required super.placeName,
    required super.featuredImage,
    required super.date,
    required super.finishDate,
    required super.paymentMethod,
    required super.images,
    required super.users,
    required super.tagTitle,
    required super.tagIcon,
    required super.communityTitle,
    required super.communityBio,
    required super.communityImage,
    required super.communityProfilePicture,
    required super.communityState,
  });
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      spots: json['spots'],
      price: json['price'],
      placeName: json['placeName'],
      featuredImage: json['featuredImage'],
      date: json['date'],
      finishDate: json['finish_date'],
      paymentMethod: json['paymentMethod'],
      //community
      communityTitle: json['community']['title'],
      communityBio: json['community']['bio'],
      communityImage: json['community']['image'],
      communityProfilePicture: json['community']['profile_picture'],
      communityState: json['community']['state'],
      images: List<EventImagesModel>.from(
        json['images'].map((item) => EventImagesModel.fromJson(item)),
      ),
      users: List<EventUsersModel>.from(
        json['users'].map(
          (item) => EventUsersModel.fromJson(item),
        ),
      ),
      tagTitle: json['tag']['title'],
      tagIcon: json['tag']['icon'],
    );
  }
}

class EventImagesModel extends EventImages {
  final String? url;
  const EventImagesModel({
    this.url,
  }) : super(url: url);
  factory EventImagesModel.fromJson(Map<String, dynamic> json) {
    return EventImagesModel(
      url: json['url'] ?? 'e93d7796-1656857401507',
    );
  }
}

class EventUsersModel extends EventUsers {
  final String? profilePicture;
  const EventUsersModel({
    this.profilePicture,
  }) : super(profilePicture: profilePicture);
  factory EventUsersModel.fromJson(Map<String, dynamic> json) {
    return EventUsersModel(
      profilePicture: json['profile_picture'] ?? 'efd4976d-1645531096730',
    );
  }
}
