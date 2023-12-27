class ApiEndpoints {
  static final ApiEndpoints _instance = ApiEndpoints._internal();

  factory ApiEndpoints() {
    return _instance;
  }

  ApiEndpoints._internal();
  String projectId = '849f8a23-7950-47a8-b93f-31f730871f04';
  String login = 'auth/login';
  String signUp = 'auth/signup?email';
  String getUser = '/user';
  String updateUser = '/user/update';
// Add more endpoints as needed
}
