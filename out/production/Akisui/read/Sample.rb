# coding: utf-8
# frozen_string_literal: true

require 'kconv'
require 'timeout'
require 'tanraku'

class Sample
  def ruby
    puts 'こんにちは、Ruby.'.toutf8
  end
end

class Sample2 < Sample
  def ruby
    puts 'さようなら, Ruby.'.toutf8
  end
end

module Sample3
  def ruby
    puts '戻ったきたぞ、Ruby.'.toutf8
  end
  module_function :ruby
end

class Sample4 < Sample2
  def ruby
    puts 'おはよう、Ruby.'.toutf8
  end
end

class Sample5 < Sample4
  def ruby
    begin
      puts 'こんばんわ、Ruby.'.toutf8
    rescue Timeout::Error, Exception => e
      puts e.backtrace
    end
  ensure
    puts 'おやすみなさい、Ruby.'.toutf8
  end
end

class Hentai
  def kyosuke
    str = %w[apple orange melon banana painapple glape]
    puts str.grep(/a/o) { |i| i.split(',').join(' ') }
  end
end

class Nise
  def sugaku
    num = [13, 56, 78, 90, 102]
    has = %w[green blue red white]
    puts num.select { |item| item <= 80 }
    puts has.select { |value| value =~ /red/o }
    puts ''
  end
end

puts ''
puts 'Sample'.center(60, '-')

Sample.new.ruby
Sample2.new.ruby
Sample3.ruby
Sample4.new.ruby
Sample5.new.ruby
Hentai.new.kyosuke
Nise.new.sugaku

puts 'Sample'.center(60, '-')

puts ''

puts 'tanraku'.center(60, '-')

Sample4.new.ruby.tanraku
# Sample5.new.ruby.tanraku_log

puts 'tanraku'.center(60, '-')

puts ''

puts 'Ruby'.center(60, '-')

puts RUBY_COPYRIGHT

# puts RUBY_VERSION
# puts RUBY_PATCHLEVEL
# puts RUBY_RELEASE_DATE
# puts RUBY_REVISION

puts RUBY_DESCRIPTION

puts 'Ruby'.center(60, '-')

puts ''

GC.start

# puts GC.stat

__END__
