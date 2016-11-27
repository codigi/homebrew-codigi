class Tufao < Formula
  desc "An asynchronous web framework for C++ built on top of Qt"
  homepage "http://vinipsmaker.github.io/tufao/"
  url "https://github.com/vinipsmaker/tufao/archive/1.4.1.tar.gz"
  sha256 "af2255f8e0addf4d92e8d6ca1ff575f17a0cff84d5c6ac68d8e4a4b0892d6b45"

  depends_on "cmake" => :build
  depends_on "boost.http"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false"
  end
end
