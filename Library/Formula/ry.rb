require 'formula'

class Ry < Formula
  homepage 'https://github.com/jayferd/ry'
  url 'https://github.com/jayferd/ry/archive/0.4.1.tar.gz'

  depends_on 'ruby-build'

  def install
    system({ 'PREFIX' => prefix }, 'make install')
  end

  def caveats; <<-EOS.undent
    Please add to your $PATH:
      #{prefix}/lib/ry/current/bin

    Alternatively, to enable completion, add to your profile:
      which ry >/dev/null 2>/dev/null && eval "$(ry setup)"

    To switch to another ruby locally to your shell, set
    your $PATH to the output of `ry fullpath <ruby_name>`
    EOS
  end

  test do
    system 'ry ls'
  end
end
