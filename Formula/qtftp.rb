class Qtftp < Formula
  desc "Qt bindings for FTP"
  homepage "https://github.com/qt/qtftp"
  url "https://github.com/qt/qtftp/archive/v5.0.0.tar.gz"
  version "5.0.0"
  sha256 "c33812dd06d48dee8a4e40a2828e4a98bbc3ed41b96202196d055dcd6bd65d92"

  depends_on "qt5"

  def install
    system "syncqt.pl -version $(qmake -version | grep -o -E 'Qt version .* in' | awk '{print $3}')"
    system Formula["qt5"].bin/"qmake", "-config", "debug_and_release build_all"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
  patch :DATA
end
__END__
diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
index e82032e..1eadad7 100644
--- a/tests/auto/auto.pro
+++ b/tests/auto/auto.pro
@@ -2,3 +2,4 @@ TEMPLATE = subdirs
 
 SUBDIRS += headersclean
 SUBDIRS += qftp
+SUBDIRS += cmake
diff --git a/tests/auto/cmake/CMakeLists.txt b/tests/auto/cmake/CMakeLists.txt
new file mode 100644
index 0000000..1221436
--- /dev/null
+++ b/tests/auto/cmake/CMakeLists.txt
@@ -0,0 +1,14 @@
+
+cmake_minimum_required(VERSION 2.8)
+
+project(qmake_cmake_files)
+
+enable_testing()
+
+find_package(Qt5Core REQUIRED)
+
+include("${_Qt5CTestMacros}")
+
+test_module_includes(
+    Ftp QFtp
+)
diff --git a/tests/auto/cmake/cmake.pro b/tests/auto/cmake/cmake.pro
new file mode 100644
index 0000000..961dc81
--- /dev/null
+++ b/tests/auto/cmake/cmake.pro
@@ -0,0 +1,7 @@
+
+# Cause make to do nothing.
+TEMPLATE = subdirs
+
+CMAKE_QT_MODULES_UNDER_TEST = ftp
+
+CONFIG += ctest_testcase
