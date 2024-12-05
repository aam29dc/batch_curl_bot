## batch curl bot
-Opens words.txt, shuffles the entries (using a .ps1 script), chooses a random search engine (out of the 5),<br>
-Simulates queries at the homepage. Each search term/word is different from the last.<br>
-If last search engine is the same, it skips the homepage query.<br>
-Attempted to appear as if a real user is browsing, to self DoS, check ISP rate-limiting features, and check search engine anti-bot features.<br>

### search.bat
-contains the script to query with curl<br>

### launch.bat
-launch 10 instances of search.bat<br>

### count.bat
-count how many instances of cmd.exe you have running<br>

#### response.log (effective url)
````
200 0.400182s https://www.google.com/
200 0.497333s https://www.google.com/search?q=unsensationally
200 1.218350s https://www.reddit.com/?rdt=63235
200 0.751912s https://www.reddit.com/search/?q=neuroplexus&rdt=33506
200 1.106301s https://www.yahoo.com/
200 0.665023s https://search.yahoo.com/search;?p=intonaci
200 0.870135s https://duckduckgo.com/
200 0.450869s https://duckduckgo.com/?q=stroys
200 1.596532s https://www.yahoo.com/
200 0.640438s https://search.yahoo.com/search;?p=danaidean
200 0.663445s https://www.reddit.com/?rdt=58853
200 0.926733s https://www.reddit.com/search/?q=czarinian&rdt=62340
200 1.575957s https://www.reddit.com/search/?q=rhinocerotidae&rdt=60038
200 0.272790s https://www.bing.com/
200 0.270424s https://www.bing.com/search?q=pomatum
...
````

##### words.txt
-use your own entries, each word or line should be escaped (not comma seperated, use new lines for each entry), example:
````
dement
rumfustian
tricuspidal
duodecimal
````

##### comments on how it can be improved
Besides using a better scripting language like python, powershell, or bash. It can made to extract a link from the html file given a `<a href=` then go to that link, to make it appear more like a real person browsing.
I didn't add time delays on purpose, but random time delays can help make it appear as a real person; sometimes a site might take long too ping and this can help add delays.

#### comments on batch scripting:
-when using `set` for declaring a variable dont use spaces before or after the `=`: `set var=Hello world` is correct, `set var = hello world` is an error<br>
-all variables are global by default, use `setlocal` and `endlocal` to declare local variables within a block<br>
-the else in a if and else control, the else must be paired with corresponding `)` from the previous if<br>
-calling a functions with a parameter that has an escaped character `^&` doesn't function well, and it was better to just pass the variable as a global instead<br>

This was to help learn the cmd prompt at a higher level, and to learn the capabilities of legacy batch scripting.<br>
