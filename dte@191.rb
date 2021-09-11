class DteAT191 < Formula
  desc "Small and configurable console text editor"
  homepage "https://github.com/craigbarnes/dte"
  url "https://gitlab.com/craigbarnes/dte/-/archive/v1.9.1/dte-v1.9.1.tar.gz"
  sha256 "c38edaa3419728cc40ff6773827718c6420741ebb3fa1d1891eacb5a7e752f87"
  license "GPL-2.0"
  revision 1

  head do
    url "https://github.com/craigbarnes/dte.git"
    mirror "https://gitlab.com/craigbarnes/dte.git"
  end

  depends_on "make" => :build

  def install
    system "make", "-j#{ENV.make_jobs}"
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    assert_equal "20", shell_output("#{bin}/dte -b compiler/gcc | wc -l").strip
  end
end
