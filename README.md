opens words.txt, shuffles the entries (using a .ps1 script), chooses a random search engine (out of the 4),
and queries at the homepage. If last search engine is the same, it skips the homepage query.
Attempted to appear as if a real user is browsing, to self DoS, check ISP rate-limiting features, and check search engine anti-bot features.

## search.bat
contains the script to query with curl

## launch.bat
launch 10 instances of search.bat

## count.bat
count how many instances of cmd.exe you have running

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
this script could be refactored with a function and parameters, but batch scripting isn't very friendly.
Also a better scripting language would to be to use .python or .powershell, but this was an attempt to learn the cmd prompt at a higher level,
and to learn the capabilities of batch scripting. It is (mostly) capable, but error reporting from batch scripting isn't friendly either.
