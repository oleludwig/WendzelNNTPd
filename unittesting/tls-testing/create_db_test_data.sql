INSERT INTO newsgroups (id, name, pflag, high) VALUES (1, 'alt.wendzelnntpd.test', 'y', 2);
INSERT INTO newsgroups (id, name, pflag, high) VALUES (2, 'alt.wendzelnntpd.test.empty', 'y', 0);
INSERT INTO newsgroups (id, name, pflag, high) VALUES (3, 'alt.wendzelnntpd.test.post', 'y', 0);

INSERT INTO postings (msgid, date, author, newsgroups, subject, lines, header)
VALUES ('<cdp1@localhost>', 1751106600, 'Testuser <test@example.com>', 'alt.wendzelnntpd.test',
        'Test', 1, 'Path: test
Message-ID: <cdp1@localhost>
Date: Sat, 28 Jun 2025 12:30:00 +0200
Lines: 1
X-WendzelNNTPdBodysize: 9
newsgroups: alt.wendzelnntpd.test
from: Testuser <test@example.com>
subject: Test
');

INSERT INTO postings (msgid, date, author, newsgroups, subject, lines, header)
VALUES ('<cdp2@localhost>', 1751106601, 'Testuser <test@example.com>', 'alt.wendzelnntpd.test',
        'Test', 1, 'Path: test
Message-ID: <cdp2@localhost>
Date: Sat, 28 Jun 2025 12:30:01 +0200
Lines: 1
X-WendzelNNTPdBodysize: 10
newsgroups: alt.wendzelnntpd.test
from: Testuser <test@example.com>
subject: Test2
');

INSERT INTO ngposts (msgid, ng, postnum) VALUES ('<cdp1@localhost>', 'alt.wendzelnntpd.test', 1);
INSERT INTO ngposts (msgid, ng, postnum) VALUES ('<cdp2@localhost>', 'alt.wendzelnntpd.test', 2);

-- create user with name "testuser" and password "password"
INSERT INTO users (name, password) VALUES ('testuser', 'c336f7d5bab8ccf4860fc53cb33290bb794d481590db02c0936fbaa74099c77d');
