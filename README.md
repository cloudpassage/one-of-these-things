#one-of-these-things

Version: *1.0*
<br />
Author: *William Stearns - @william-stearns - wstearns@pobox.net*

This tool provides one report per Halo group showing where the machines are the same, and where they differ. ("One of these things is not like the other")

###*Features:*
* One report per group, and one more combined report for every machine
* Summarizes:
    * Installed packages which may need attention
    * CVE items that may affect your system
    * Server accounts
    * Hosting company
    * All SCA (Configuration) checks with issues
* Each of the above is summarized, so you get a count of how many machines have the same status; click on the number and you're given their hostnames as well.
* Issues prioritized, both by whether all servers match or not, but also by bad+critical, bad, indeterminate, and good.
* Can work with multiple halo portal accounts at once
* Only needs a read-only API key
* Supports using an https proxy



##List of Files

* Gemfile
* Gemfile.lock
* LICENSE.txt
* README.md
* one-of-these-things.rb


##Requirements and Dependencies

* The Ruby interpreter must be installed on the machine that executes the script.
* The following ruby gems installed: oauth2, rest-client, json, public_suffix, optparse, resolv, date, and ip.  The following command will install all optional gems needed by the CloudPasssage API clients:

        sudo gem install oauth2 rest-client json public_suffix ip

* A Read only (preferred) or Full access API key and secret (*), placed in /etc/halo-api-keys separated by a vertical pipe, like: aa00bb44|11111111222222223333333344444444 . This file should be owned by the user that runs api scripts, mode 600. 
* *Developers only: If you're working with an alternate grid, put that grid's api hostname and port in the third column of the line: aa00bb44|11111111222222223333333344444444|api.example.com:9999*


##Installation 

* Copy one-of-these-things.rb and wlslib.rb to the same directory in your path. wlslib.rb will also be found if you copy it to any directory in your ruby library search path, which can be seen by running echo 'puts $:' | irb


##Usage


###*Example Commands*
* See help text and parameters:
        one-of-these-things.rb -h

* Generate html reports for each group and save to the current directory:
        one-of-these-things.rb -i aabbcc00


###*Advanced Uses*

If you manage more than one Halo Portal organization, you can generate a report that covers logins from all of them by specifying "-i {key}" multiple times (with corresponding lines for all keys in /etc/halo-api-keys :
```
one-of-these-things.rb -i aabbcc00 -i 7890abcd
```

