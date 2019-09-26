class Dte < Formula
  desc "Small and configurable console text editor"
  homepage "https://github.com/craigbarnes/dte"
  url "https://github.com/craigbarnes/dte/releases/download/v1.9/dte-1.9.tar.gz"
  sha256 "79510df2b9e7039f33976ca0e0040f98493e9c2bfecdfbcd0bb39cbe54468788"

  def install
    system "make", "-j#{ENV.make_jobs}"
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    assert_equal "20", shell_output("#{bin}/dte -b compiler/gcc | wc -l").strip
  end
end
