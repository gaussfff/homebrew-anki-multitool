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
        
        # Generate fish completions if fish is available
        if File.exist?("/opt/homebrew/bin/fish") || File.exist?("/usr/local/bin/fish")
            fish_completion_content = <<~EOS
                # Fish completions for anki-mtool
                complete -c anki-mtool -f
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "info" -d "Show description about anki-multitool"
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "version" -d "Show version of anki-multitool"
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "decklist" -d "List all decks in your Anki collection"
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "newdeck" -d "Create a new deck in Anki"
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "json2deck" -d "Import a deck from a JSON file into Anki"
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "deck2json" -d "Export a deck from Anki to a JSON file"
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "md2deck" -d "Import a deck from a Markdown file into Anki"
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "deck2md" -d "Export a deck from Anki to a Markdown file"
                complete -c anki-mtool -n "not __fish_seen_subcommand_from info version decklist newdeck json2deck deck2json md2deck deck2md help" -a "help" -d "Print help message or help for subcommand"
            EOS
            (buildpath/"anki-mtool.fish").write fish_completion_content
            fish_completion.install buildpath/"anki-mtool.fish"
        end
    end

    test do
        system "#{bin}/anki-mtool", "help"
    end
end
