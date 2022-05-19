class Dte < Formula
  desc "Small and configurable console text editor"
  homepage "https://github.com/craigbarnes/dte"
  url "https://github.com/craigbarnes/dte/releases/download/v1.10/dte-1.10.tar.gz"
  sha256 "db62aab235764f735adc8378f796d6474596582b7dae357e0bddf31304189800"
  license "GPL-2.0"
  revision 1

  head do
    url "https://github.com/craigbarnes/dte.git"
    mirror "https://gitlab.com/craigbarnes/dte.git"
  end

  depends_on "make" => :build

  def install
    make = OS.mac? ? Formula["make"].opt_bin/"gmake" : "make"
    system make, "-j#{ENV.make_jobs}"
    system make, "prefix=#{prefix}", "install"
  end

  test do
    assert_equal "20", shell_output("#{bin}/dte -b compiler/gcc | wc -l").strip
  end
end
