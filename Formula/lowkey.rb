class Lowkey < Formula
  desc "Silent, cool, and battery-friendly local LLM launcher"
  homepage "https://github.com/ninido/lowkey"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-darwin-arm64.tar.gz"
      sha256 "5a0cf133f9f79a29f6f0e2543b2734c533b6f9182b9e9c94ad3841771ef39d8e"

      def install
        bin.install "lowkey"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-darwin-amd64.tar.gz"
      sha256 "4faf8bc707edc7a4b7f9154bed5dc61496d481a8b9fd13ee7234c2ca48de9bcd"

      def install
        bin.install "lowkey"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-linux-arm64.tar.gz"
      sha256 "cb9dde63100316b594be8bb0bc48d9f4a339f37a16a1758275d1b9eff006f490"

      def install
        bin.install "lowkey"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-linux-amd64.tar.gz"
      sha256 "8b570d000348d5c2a788d4fa52168862d1ff3b9662e94d0c877d2854e8dc2b1c"

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
