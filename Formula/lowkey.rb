class Lowkey < Formula
  desc "Silent, cool, and battery-friendly local LLM launcher"
  homepage "https://github.com/ninido/lowkey"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-darwin-arm64.tar.gz"
      sha256 "4ff8caa4d81f63ebd1acd654921e09203a5711aefcfb1649df8c636acaeceafa"

      def install
        bin.install "lowkey"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-darwin-amd64.tar.gz"
      sha256 "b1829a17764131dfd1b3ffd955ec6f9aff71122ec629808f38aa992d7a53ecfb"

      def install
        bin.install "lowkey"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-linux-arm64.tar.gz"
      sha256 "219e2d3e684cff5b4c7cb02fb165825ea60dea0c550a0e75771d5a56a0e14422"

      def install
        bin.install "lowkey"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ninido/lowkey/releases/download/v#{version}/lowkey-linux-amd64.tar.gz"
      sha256 "b91efc4e72aa88d245dfacad8f873549294cdd372d60c732eb028b9e4b5032e0"

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
