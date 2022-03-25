# Cipher me Up

Cipher me up is a tool used to cipher a word. It was built with `Thor` gem to provide a command-line interface.

To check available commands run `bundle exec exe/cipher help`. If you want to know more details about a specific command run `bundle exec exe/cipher help 'command'` (e.g. `bundle exec exe/cipher help word`). 

There are two kinds of ciphering available: using a `keyword` or a `shift_factor`.

### Keyword

Uses a method inspired by Vigenere Cipher, allowing ciphering a word with letters and numbers only, depending on a word to shift the characters dinamically.

Each letter from the keyword provided indicates how many shift forward each character is taking. Keyword is used sequently, until it reaches the end of the word to be ciphered. To shift characters, there will be a comparion between the ordinal number from the character of keyword and the character to be shifted. The number resulted from this comparison is the amount of times the character in question will be shifted.  

### Shift Factor

Uses an adaptation to Caesar Cipher, allowing ciphering a word with letters and numbers only, depending on a number to shift the characters.

The number provided indicates how many characters will be shifted forward in each letter from the word to be ciphered to form a new word.


## Running cipher me up

As mentioned above, you can cipher a word using a keyword:

```
bundle exec exe/cipher word CIPHER_ME_UP --with keyword --value cipher
```

Or a fixed shift factor:

```
bundle exec exe/cipher word CIPHER_ME_UP --with shift_factor --value 3
```
