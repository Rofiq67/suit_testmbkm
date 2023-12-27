class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class PagingInfo {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;

  PagingInfo({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
  });

  factory PagingInfo.fromJson(Map<String, dynamic> json) {
    return PagingInfo(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
    );
  }
}

class Support {
  final String url;
  final String text;

  Support({required this.url, required this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }
}

class ApiResponse {
  final List<User> data;
  final PagingInfo pagingInfo;
  final Support support;

  ApiResponse({
    required this.data,
    required this.pagingInfo,
    required this.support,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: List<User>.from(json['data'].map((user) => User.fromJson(user))),
      pagingInfo: PagingInfo.fromJson(json),
      support: Support.fromJson(json['support']),
    );
  }
}
