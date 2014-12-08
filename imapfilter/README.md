imapfilter
==========

Simple image for imapfilter tool (https://github.com/lefcha/imapfilter)

Description
-----------

```
  IMAPFilter is a mail filtering utility. It connects to remote mail servers
  using the Internet Message Access Protocol (IMAP), sends searching queries to
  the server and processes mailboxes based on the results. It can be used to
  delete, copy, move, flag, etc. messages residing in mailboxes at the same or
  different mail servers. The 4rev1 and 4 versions of the IMAP protocol are
  supported.

  IMAPFilter uses the Lua programming language as a configuration and extension
  language.
```

Usage
-----

docker run -d -v /path_to_my_config:/root/.imapfilter ka2er/imapfilter

Volume
------

- */root/.imapfilter* this volume should contains your configuration file "config.lua" (imap access, rules etc..)
  
You should see http://man.cx/imapfilter_config(5) for info about configuration file syntax.