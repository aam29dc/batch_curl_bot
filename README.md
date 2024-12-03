## batch curl bot
opens words.txt, shuffles the entries (using a .ps1 script), chooses a random search engine (out of the 4),<br>
and queries at the homepage. If last search engine is the same, it skips the homepage query.<br>
Attempted to appear as if a real user is browsing, to self DoS, check ISP rate-limiting features, and check search engine anti-bot features.<br>

### search.bat
contains the script to query with curl
<br>

### launch.bat
launch 10 instances of search.bat
<br>

### count.bat
count how many instances of cmd.exe you have running
<br>

#### response.log
````
200 1.407508s googlesearch?q=biurate 
200 0.492720s yahoo 
200 1.014760s yahoosearch;?p=sulphostannide&fr=sfp&fr2=sb-top 
200 0.418944s duckduckgo 
200 0.609388s duckduckgo?q=imperium&ia=web 
200 0.523881s yahoo 
200 1.188855s yahoosearch;?p=hypocotyledonous&fr=sfp&fr2=sb-top 
200 0.325176s google 
200 1.073659s googlesearch?q=clawback 
200 1.095745s googlesearch?q=welds 
200 0.301782s bing 
200 0.255166s bingsearch?q=dvornik 
200 0.439573s yahoo 
200 1.071123s yahoosearch;?p=scraggiest&fr=sfp&fr2=sb-top 
...
````
This was to help learn the cmd prompt at a higher level, and to learn the capabilities of batch scripting.<br>

##### words.txt
use your own entries, each word or line should be escaped (not comma seperated, use new lines for each entry), example:
````
dement
rumfustian
tricuspidal
duodecimal
````

#### comments on batch scripting:
when using `set` for declaring a variable dont use spaces before or after the `=`: `set var=Hello world` is correct, `set var = hello world` is an error
<br>
all variables are global by default, use `setlocal` and `endlocal` to declare local variables within a block
<br>
the else in a if and else control, the else must be paired with corresponding `)` from the previous if
<br>
