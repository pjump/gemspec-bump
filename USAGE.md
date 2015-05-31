#Usage: gemspec-version VERSION VERSION_DIFF

gemspec-version combines a VERSION string with a VERSION_DIFF string.
A version is a series of integers seperated by dots.
A versiondiff is a series of integers, optionaly prepended by the + or - sign.

Each VERSION integer is combined with its corresponding VERSION_DIFF integer in the following
fashion:

- An unsigned integer overwrites the VERSION integer.
- A signed integer (+ or -) is added to the VERSION integer.
- The righter-most VERSION_DIFF integer combines with the righter-most VERSION integer

##Examples:
  #Bump the third digit by 1
  gemspec-version 1.1.1 +1
  => 1.1.2

  #Bump the second digit by 1, zeroing the third
  gemspec-version 1.1.1 +1.0
  => 1.1.2

  #Set the first digit to 5, bump the second by one, and set the last one to 0
  gemspec-version 1.0.1 5.+1.0
  => 5.1.0

  #Bump the second digit by 3; set the last one to 4
  gemspec-version 1.1.1 +3.4
  => 1.4.4
