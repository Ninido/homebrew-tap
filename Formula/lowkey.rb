class Lowkey < Formula
  desc "Silent, cool, and battery-friendly local LLM launcher"
  homepage "https://github.com/ninido/lowkey"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-darwin-arm64"
      sha256 "5b8f7cc49c805b0a14597f62e8976a28e42351a59e8573efc9b8a07262d10dd7"

      def install
        bin.install "lowkey-darwin-arm64" => "lowkey"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-darwin-amd64"
      sha256 "09981a277bbaf7977b1497e70fdbf4bff4946a357d901aec9cfd86c746724fe3"

      def install
        bin.install "lowkey-darwin-amd64" => "lowkey"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-linux-arm64"
      sha256 "ee7bb736c53209bb3f03de92869e3aac98dba66708b6b8ebcd17c5f5d1ce9148"

      def install
        bin.install "lowkey-linux-arm64" => "lowkey"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-linux-amd64"
      sha256 "1de5e1761a00deb3e747fcf49feee1d4cff3e36e8da5214f76b7bf85237b51bb"

      def install
        bin.install "lowkey-linux-amd64" => "lowkey"
      end
    end
  end

  test do
    assert_predicate bin/"lowkey", :exist?
    assert_predicate bin/"lowkey", :executable?
  end
end
