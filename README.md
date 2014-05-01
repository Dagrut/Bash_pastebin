Bash pastebin
=============

Bash pastebin is a pastebin-like serverless bash web server, aimed for LAN 
use only.

Usage
-----

	./server.sh [port]

If empty, the port will be 8080.

You should NOT run this program as root.

Goal
----

The aim of this program is to share pieces of informations with people near 
you when you don't have a USB key, an internet connection, and when using 
netcat alone is soooo tiring...

It was not meant to be used :
- Over the internet
- To exchange big files
- To be beautiful
- To be used as a database
- To share secret informations

even if it could. It was only meant to :
- Be simple to use, update and fix
- Have almost no dependancies (No php, perl, ruby, node.js, apache, mysql,
  sqlite, jquery, bootstrap, framework, internet connection, ...)
- Be as small and portable as possible
- Store no 100% permanent data (which explains why I use /tmp)

How does it work?
-----------------

Fast answer: read the sources, they are quite small!

Long answer: No long answer, just read the sources, it will still be faster :p

Requirements
------------

* Browser
  * Any browser with basic javascript support should do the job
* Bash
  * netcat
  * echo
  * tr
  * cut
  * grep
  * head
  * mkdir
  * rm
  * cat
  * ls
  * base64
  * sed

FAQ
---

* Q1: This program crashed my computer/burned my house/spawned aliens.
* A1: Then don't use it again.
* Q2: The web page is ugly!
* A2: See the 'Goal' part again.
* Q3: It does not work with browser X/version Y/OS Z/...
* A3: I tried to make it portable. If you can fix it, send me a patch.
* Q4: It crashes when I do something.
* A4: Send me a patch or tell me what something you are doing so I can fix it.

Licence
-------

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
Version 2, December 2004

Copyright (C) 2014 Dagrut

Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name is changed.

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

 0. You just DO WHAT THE FUCK YOU WANT TO.
