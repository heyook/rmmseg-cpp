## rmmseg-cpp
  
  * by pluskid
  * http://rmmseg-cpp.rubyforge.org

### DESCRIPTION:

rmmseg-cpp is a high performance Chinese word segmentation utility for
Ruby. It features full "Ferret":http://ferret.davebalmain.com/ integration
as well as support for normal Ruby program usage.

rmmseg-cpp is a re-written of the original
RMMSeg(http://rmmseg.rubyforge.org/) gem in C++. RMMSeg is written
in pure Ruby. Though I tried hard to tweak RMMSeg, it just consumes
lots of memory and the segmenting process is rather slow.

The interface is almost identical to RMMSeg but the performance is
much better. This gem is always preferable in production
use. However, if you want to understand how the MMSEG segmenting
algorithm works, the source code of RMMSeg is a better choice than
this.

### FEATURES/PROBLEMS:

* Runs fast and the memory consumption is small.
* Support user customized dictionaries.
* Easy Ferret integration.

### SYNOPSIS:

####  A simple script

rmmseg-cpp provides a simple script, which can read the text from
standard input and print the segmented result to standard output. Try
<tt>rmmseg -h</tt> for help on the options.

#### In a normal Ruby program

To use rmmseg-cpp in normal Ruby program, first load the package and
init by loading the dictionaries:

```ruby
require 'rubygems'
require 'rmmseg'

RMMSeg::Dictionary.load_dictionaries
```

If you want to add customized dictionaries, append them to 
+RMMSeg::Dictionary.dictionaries+ before calling +load_dictionaries+.
The formats of chars.dic and  words.dic are NOT the same:

* For chars.dic, each line contains freq, a space, and then the character
* For words.dic, each line contains length, a space, and then the word.

Note length mean the length of the word, i.e. the number of characters
of the word, not number of bytes. WARNING: there should be a newline at
the end of every dictionary file.

Then create a +Algorithm+ object and call +next_token+ until got a
+nil+:

```ruby
  algor = RMMSeg::Algorithm.new(text)
  loop do
    tok = algor.next_token
    break if tok.nil?
    puts "#{tok.text} [#{tok.start}..#{tok.end}]"
  end
```

#### With Ferret

To use rmmseg-cpp with Ferret, just use the analyzer provided:

```ruby
  analyzer = RMMSeg::Ferret::Analyzer.new { |tokenizer|
    Ferret::Analysis::LowerCaseFilter.new(tokenizer)
  }

  index = Ferret::Index::Index.new(:analyzer => analyzer)
```

See <tt>misc/ferret_example.rb</tt> for a complete example.

### REQUIREMENTS:

* ruby 1.8.x, ruby 1.9x
* g++

## INSTALL:

* sudo gem install rmmseg-cpp
