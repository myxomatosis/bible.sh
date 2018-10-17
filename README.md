# bible.sh
Command Line Interface (CLI) for biblegateway.com
This is a simple bash script for quick scripture verse lookups. It aims to be simple yet readable. If you find any bugs please open an issue.

You can install the by moving the script to ~/bin/ or downloading it straight there:
```
wget -O ~/bin/bible.sh https://github.com/myxomatosis/bible.sh/raw/master/bible.sh
```
## Dependencies
html2text

To install on Debian based distros:
```
sudo apt install html2text
```
To install on RedHat based distros:
```
sudo yum install html2text #Requires the epel repo
```
## Examples
### Look up a verse from the command line:
```
example@example ~ $ ./bible.sh john 3:16
****** John 3:16 King James Version (KJV) ******
For God so loved the world, that he gave his only begotten Son, that
whosoever believeth in him should not perish, but have everlasting life.
```
### Specify the translation:
```
example@example ~ $ ./bible.sh john 3:16 ver=NKJV
****** John 3:16 New King James Version (NKJV) ******
For God so loved the world that He gave His only begotten Son, that whoever
believes in Him should not perish but have everlasting life.
```
A full list of translations can be found here only abbreviations can be specified:
https://www.biblegateway.com/versions/
### Look up more than one verse in New King James Version translation:
```
example@example ~ $ ./bible.sh john 3:16-17 ver=NKJV
****** John 3:16 New King James Version (NKJV) ******
For God so loved the world that He gave His only begotten Son, that whoever
believes in Him should not perish but have everlasting life.

****** John 3:17 New King James Version (NKJV) ******
For God did not send His Son into the world to condemn the world, but that
the world through Him might be saved.

example@example~ $
```
### Look up a whole chapter (edited for brevity):
```
example@example ~ $ ./bible.sh John 3
****** John 3 King James Version (KJV) ******
There was a man of the Pharisees, named Nicodemus, a ruler of the Jews:
The same came to Jesus by night, and said unto him, Rabbi, we know that thou
art a teacher come from God: for no man can do these miracles that thou doest,
except God be with him.
...
The Father loveth the Son, and hath given all things into his hand.
He that believeth on the Son hath everlasting life: and he that believeth
not the Son shall not see life; but the wrath of God abideth on him.
example@example ~ $ 
```
You'll also notice in the previous examples that the case of the characters does not matter. The search is a bit fuzzy.
