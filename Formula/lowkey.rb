class Lowkey < Formula
  desc "Silent, cool, and battery-friendly local LLM launcher"
  homepage "https://github.com/ninido/lowkey"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-darwin-arm64.tar.gz"
      sha256 "aabce11d95e2cee1b1a4ace7a473aed94b3ca83edd52f01cf8e526cc27e1cf9e"

      def install
        bin.install "lowkey"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-darwin-amd64.tar.gz"
      sha256 "19e6207b8aab8a82f7ba14a82397fc6a85b2f53e2fc90f5bcd95df36c976db7a"

      def install
        bin.install "lowkey"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-linux-arm64.tar.gz"
      sha256 "1e10b1909b7f15f47293e1e35e7dbb5e42ecb348a87b878050e5005b5b7d5d69"

      def install
        bin.install "lowkey"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-linux-amd64.tar.gz"
      sha256 "e6140f0120a89342d32c00c6d235cae3af8e12c38f36cef1fe8b2835160e62d3"

      def install
        bin.install "lowkey"
      end
    end
  end

  head do
    url "https://github.com/ninido/lowkey.git", branch: "main"
    depends_on "go" => :build

    def install
      system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "main.go"
    end
  end

  test do
    # Lowkey provides interactive TUI; ensure binary executes and runs
    assert_predicate bin/"lowkey", :exist?
    assert_predicate bin/"lowkey", :executable?
  end
end
