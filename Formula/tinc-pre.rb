class TincPre < Formula
  desc "Virtual Private Network (VPN) tool"
  homepage "https://www.tinc-vpn.org/"
  url "https://www.tinc-vpn.org/packages/tinc-1.1pre18.tar.gz"
  sha256 "2757ddc62cf64b411f569db2fa85c25ec846c0db110023f6befb33691f078986"
  license "GPL-2.0-or-later"

  depends_on "lzo"
  depends_on "openssl"

  uses_from_macos "zlib"

  def install
    system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}",
                          "--with-openssl=#{Formula["openssl"].opt_prefix}"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{sbin}/tincd --version")
  end
end
