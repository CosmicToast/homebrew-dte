class Dte < Formula
  desc "Small and configurable console text editor"
  homepage "https://github.com/craigbarnes/dte"
  url "https://github.com/craigbarnes/dte/archive/v1.9.1.tar.gz"
  sha256 "80d2732269a308b5e1126ecc16c28cda032864f625a95184821a73c054f81a2d"

  def install
    system "make", "-j#{ENV.make_jobs}"
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    assert_equal "20", shell_output("#{bin}/dte -b compiler/gcc | wc -l").strip
  end
end
