class AnkiMultitool < Formula
    desc "Just useful multitool for Anki users"
    homepage "https://github.com/gaussfff/anki-multitool"
    url "https://github.com/gaussfff/anki-multitool/releases/latest/download/anki-mtool-macos-aarch64.tar.gz"

    on_macos do
        if Hardware::CPU.arm?
            # URL is set above for ARM64 macOS
        end
    end

    def install
        bin.install "anki-mtool"
    end

    test do
        system "#{bin}/anki-mtool", "help"
    end
end
