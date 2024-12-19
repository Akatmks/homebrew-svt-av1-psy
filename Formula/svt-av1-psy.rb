class SvtAv1Psy < Formula
  homepage "https://svt-av1-psy.com"
  license "BSD-3-Clause-Clear"
  head "https://github.com/gianni-rosato/svt-av1-psy.git"

  depends_on "obuparse"
  depends_on "gnu-sed" => :build
  
  def install
    Dir.chdir "Build/linux" do
      system "./build.sh", "--native", "--static", "--release", "--enable-lto"
    end
    Dir.chdir "Bin/Release" do
      bin.install "SvtAv1EncApp"
      lib.install "libSvtAv1Enc.a"
    end
  end
end
