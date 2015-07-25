class Goon < Formula
  desc "Middleman implementation for Porcelain"
  homepage "https://github.com/alco/goon"
  url "https://github.com/alco/goon/archive/v1.1.1.tar.gz"
  sha256 "d1fe8987248b0896e65e1203c7c93cc518c3437381584546d356ae8288fed27e"

  head "https://github.com/alco/goon.git"

  stable do
    # Fix version 1.1.1 reporting as 1.1.0
    # https://github.com/alco/goon/pull/5
    patch do
      url "https://github.com/alco/goon/pull/5.diff"
      sha256 "78e564a693663e70a65c882cc87771155c2df12c538d0ab19f660ac019aa0766"
    end
  end

  bottle do
    cellar :any
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "build"
    bin.install "goon-#{version}" => "goon"
  end

  test do
    system bin/"goon", "-v"
  end
end
