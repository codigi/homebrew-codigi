class BoostHttp < Formula
  desc "Embeddable C++ HTTP server"
  homepage "https://boostgsoc14.github.io/boost.http/"
  head "https://github.com/BoostGSoC14/boost.http.git", :using => :git
#  url "https://github.com/BoostGSoC14/boost.http/archive/v0.3.tar.gz"
#  sha256 "5c115336e73854c8639611194283d1ae43ab57c223bb24670218ccdc0d54ba2e"

  depends_on "boost"

  def install
    include.install Dir["include/*"]
  end

  test do
    system "false"
  end
end
