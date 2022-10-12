class ApiContent {
  static String baseUrl = 'http://test.meetntrain.com';
  static String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE';
  static String getEvent(int numPage) =>
      '$baseUrl/v1/profile/events/upcoming/8357?page=$numPage&date_gte=04-09-2022';
  static String baseImage = 'https://ik.imagekit.io/tnc8pizf9e';
  static String getImage(String image) => '$baseImage/$image?tr=w-100,h-100';
}
