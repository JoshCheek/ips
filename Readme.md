Interactive Process
===================

About
-----

**NOTE THAT NONE OF THIS ACTUALLY WORKS YET, I JUST WROTE THE README SO I'D KNOW WHERE I'M GOING WITH IT**

How often do you wind up slowly building up commands like this?  `ps aux | grep ruby | grep -v grep | awk '{print $2}' | xargs kill -9`
For me, it's annoyingly too often, and it usually takes experimentation each time to get it right.

Interactive Process (binary name: ips) tries to alleviate this pain by catering to this workflow.

When you run it, it will list all your processes. As you type, it will dynamically filter down to the processes that match.

Commands:
---------

* `M-k` kill the processes being displayed
* `M-p` send the processes to stdout and exit
* `M-f` add another filter
* `M-u` remove the last filter
* `M-q` quit
* `M-h` select which headers to display
* `M-c` toggle colour on/off
* `C-j` scroll the screen down
* `C-k` scroll the screen up

What does M-k and C-j mean?
---------------------------

Where M-k means Meta-k, and C-j means Control-j. Meta can be "pressed" by pressing and releasing the escape key, and then the letter.
This is kind of obnoxious, though. Fortunately, every terminal I have used allows you to set an alternate meta key
(on OSX, I've rebound it to option, so M-k means Option-k).


Installation
------------

This is witten in [Ruby](http://www.ruby-lang.org/), you'll need a Ruby interpreter. Once you have a Ruby interpreter, you should have the `gem` command, which is Ruby's package manager.

    gem install interactive_process

You might need to install the ncurses C library on your computer, IDK, it just worked for me, so I haven't had to figure that out yet (if you do, you'll probably also have to reinstall the gem).

License
-------

           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                       Version 2, December 2004

    Copyright (C) 2013 Josh Cheek <josh.cheek@gmail.com>

    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.

               DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
      TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

     0. You just DO WHAT THE FUCK YOU WANT TO.
