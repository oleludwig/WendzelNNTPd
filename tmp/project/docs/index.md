[TOC]

WendzelNNTPd is a tiny but easy to use Usenet server (NNTP server) for Linux, *nix and BSD. The server is written in C. For security reasons, it is compiled with stack smashing protection by default, if your compiler supports that feature.

# Features

## License
WendzelNNTPd uses the GPLv3 license.

## Database Abstraction Layer

The server contains a database abstraction layer. Currently supported database systems are SQlite3 and MySQL 
(and experimental PostgreSQL support). New databases can be easily added.

## Security
WendzelNNTPd contains different security features, the most important features are probably Access Control Lists (ACLs)
and the Role Based Access Control (RBAC) system. ACL and RBAC are described in a own chapter. WendzelNNTPd was probably 
the first Usenet server with support for RBAC.

Another feature that was introduced by WendzelNNTPd (and later adopted by other servers) are so-called 
"invisible newsgroups": If access control is activated, a user without permission to access the newsgroup will not be able to see the existence of the newsgroup. In case the user knows about the existence of the newsgroup nevertheless, he will not be able to post to or read from the newsgroup.

However, **please note** that the salting for password hashing is using SHA-256, but with a global user-definable salt that is concatenated with the username and password, rendering it less secure than using unique random hashes per password.
%
WendzelNNTPd does support TLS v1.0 to v1.3 including STARTTLS!

# Contribute
a

# History
b
