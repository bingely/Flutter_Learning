class FileUtil {
  static String getImagePath(String name,
      {String dir: 'default', String format: 'jpg'}) {
    return 'assets/images/$dir/$name.$format';
  }

  /// 文件的删除操作 TODO
}
