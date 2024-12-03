## batch curl bot
opens words.txt, shuffles the entries (using a .ps1 script), chooses a random search engine (out of the 4),<br>
and queries at the homepage. If last search engine is the same, it skips the homepage query.<br>
Attempted to appear as if a real user is browsing, to self DoS, check ISP rate-limiting features, and check search engine anti-bot features.<br>

### search.bat
contains the script to query with curl<br>

### launch.bat
launch 10 instances of search.bat<br>

### count.bat
count how many instances of cmd.exe you have running<br>

#### response.log
````
200 0.290939s duckduckgo 
200 0.507272s duckduckgo?q=loneliest&ia=web 
200 0.281882s bing 
200 0.316470s bingsearch?q=excandescent 
200 0.335452s google 
200 0.704805s googlesearch?q=paleocrystic 
200 0.489618s yahoo 
200 1.041893s yahoo?p=enduement&fr=sfp&fr2=sb-top 
200 0.303396s google 
200 0.655813s googlesearch?q=arteriopalmus 
200 0.751769s googlesearch?q=chouses 
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

##### comments on how it can be improved
Besides using a better scripting language like python, powershell, or bash. It can made to extract a link from the html file given a `<a href=` then go to that link, to make it appear more like a real person browsing.
I didn't add time delays on purpose, but random time delays can help make it appear as a real person; sometimes a site might take long to ping and this can help add delays.

#### comments on batch scripting:
when using `set` for declaring a variable dont use spaces before or after the `=`: `set var=Hello world` is correct, `set var = hello world` is an error<br>
all variables are global by default, use `setlocal` and `endlocal` to declare local variables within a block<br>
the else in a if and else control, the else must be paired with corresponding `)` from the previous if
<br>
