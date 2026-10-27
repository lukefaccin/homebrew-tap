class BlinkReminder < Formula
  desc "Menu bar app that reminds you to look 20 meters away"
  homepage "https://github.com/lukefaccin/blink-reminder"
  url "https://github.com/lukefaccin/blink-reminder.git",
      tag:      "v1.1.0",
      revision: "5f70307cefa9c43dabe126969fe213f8d9390aca"
  license "Apache-2.0"
  head "https://github.com/lukefaccin/blink-reminder.git", branch: "main"

  depends_on macos: :sonoma

  def install
    system "scripts/build-app.sh"
    prefix.install "build/BlinkReminder.app"
  end

  service do
    run opt_prefix/"BlinkReminder.app/Contents/MacOS/BlinkReminder"
    keep_alive crashed: true
    process_type :interactive
  end

  test do
    assert_path_exists prefix/"BlinkReminder.app/Contents/MacOS/BlinkReminder"
  end
end
