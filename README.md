# one-of-these-things

Version: *2.0*
<br />
Author: *William Stearns - @william-stearns - wstearns@pobox.com*
Feedback: *toolbox@cloudpassage.com*

This tool provides one report per Halo group showing where the machines are the same, and where they differ. ("One of these things is not like the other")

### *Features:*
* One report per group, and one more combined report for every machine
* Summarizes:
    * Installed packages which may need attention
    * CVE items that may affect your system
    * Hosting company
    * All SCA (Configuration) checks with issues
* Each of the above is summarized, so you get a count of how many machines have the same status; click on the number and you're given their hostnames as well.
* Issues prioritized, both by whether all servers match or not, but also by bad+critical, bad, indeterminate, and good.
* Only needs a read-only API key

Version 2 of this application changes very little inside the application itself,
but ships it with a Dockerfile that will allow you to run it more easily,
without suffering through dependency resolution.  The original documentation
is included as README-ORIGINAL.md, and contains more information about the
application components themselves.

### Running the app

Running the application as described will result in a directory you specify
($REPORT_DIR) being populates with HTML reports, one per group.

#### Set these environment variables:

| Var              | Purpose                           |
|------------------|-----------------------------------|
| HALO_API_KEY     | Halo API ID                       |
| HALO_API_SECRET  | Halo API Secret                   |
| REPORT_DIR       | Destination directory for reports |


#### Build the container
        docker build -t one-of-these-things .

#### Running the application
        docker run -it --rm \
            -v $REPORT_DIR:/reports \
            -e HALO_API_KEY=$HALO_API_KEY \
            -e HALO_API_SECRET=$HALO_API_SECRET \
            one-of-these-things


<!---
#CPTAGS:community-supported audit
#TBICON:images/ruby_icon.png
-->
