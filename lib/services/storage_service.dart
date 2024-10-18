class StorageService {
  final Map<String, dynamic> _storage = {};

  // Save data with a key
  void saveData(String key, dynamic value) {
    _storage[key] = value;
  }

  // Retrieve data by key
  dynamic getData(String key) {
    return _storage.containsKey(key) ? _storage[key] : null;
  }

  // Remove data by key
  void removeData(String key) {
    if (_storage.containsKey(key)) {
      _storage.remove(key);
    }
  }
}
