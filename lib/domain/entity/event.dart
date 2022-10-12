import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final int id;
  final String title;
  final String description;
  final int spots;
  final int price;
  final String placeName;
  final String featuredImage;
  final String date;
  final List<EventImages> images;
  final List<EventUsers> users;
  final String tagTitle;
  final String tagIcon;
  //
  final String finishDate;
  final String paymentMethod;
  //community
  final String communityTitle;
  final String communityBio;
  final String communityImage;
  final String communityProfilePicture;
  final String communityState;
  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.spots,
    required this.price,
    required this.placeName,
    required this.featuredImage,
    required this.date,
    required this.finishDate,
    required this.paymentMethod,
    required this.images,
    required this.users,
    required this.tagTitle,
    required this.tagIcon,
    required this.communityTitle,
    required this.communityBio,
    required this.communityImage,
    required this.communityProfilePicture,
    required this.communityState,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        spots,
        price,
        placeName,
        featuredImage,
        date,
        finishDate,
        paymentMethod,
        images,
        users,
        tagTitle,
        tagIcon,
        communityTitle,
        communityBio,
        communityImage,
        communityProfilePicture,
        communityState,
      ];
}

class EventImages extends Equatable {
  final String? url;
  const EventImages({
    this.url,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        url,
      ];
}

class EventUsers extends Equatable {
  final String? profilePicture;
  const EventUsers({
    this.profilePicture,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        profilePicture,
      ];
}
