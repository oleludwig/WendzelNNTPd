INSERT INTO newsgroups (id, name, pflag, high) VALUES (1, 'alt.wendzelnntpd.test', 'y', 2);
INSERT INTO newsgroups (id, name, pflag, high) VALUES (2, 'alt.wendzelnntpd.test.empty', 'y', 0);
INSERT INTO newsgroups (id, name, pflag, high) VALUES (3, 'alt.wendzelnntpd.test.post', 'y', 0);

INSERT INTO postings (msgid, date, author, newsgroups, subject, lines, header)
VALUES ('<cdp1@localhost>', 1751106600, 'Testuser <test@example.com>', 'alt.wendzelnntpd.test','Test', '1',
        'Path: test\r\nMessage-ID: <cdp1@localhost>\r\nDate: Sat, 28 Jun 2025 12:30:00 +0200\r\nLines: 1\r\nX-WendzelNNTPdBodysize: 9\r\nnewsgroups: alt.wendzelnntpd.test\r\nfrom: Testuser <test@example.com>\r\nsubject: Test\r\n');

INSERT INTO postings (msgid, date, author, newsgroups, subject, lines, header)
VALUES ('<cdp2@localhost>', 1751106601, 'Testuser <test@example.com>', 'alt.wendzelnntpd.test','Test', '1',
        'Path: test\r\nMessage-ID: <cdp2@localhost>\r\nDate: Sat, 28 Jun 2025 12:30:01 +0200\r\nLines: 1\r\nX-WendzelNNTPdBodysize: 10\r\nnewsgroups: alt.wendzelnntpd.test\r\nfrom: Testuser <test@example.com>\r\nsubject: Test2\r\n');

INSERT INTO ngposts (msgid, ng, postnum) VALUES ('<cdp1@localhost>', 'alt.wendzelnntpd.test', 1);
INSERT INTO ngposts (msgid, ng, postnum) VALUES ('<cdp2@localhost>', 'alt.wendzelnntpd.test', 2);

-- create user with name "testuser" and password "password"
INSERT INTO users (name, password) VALUES ('testuser', 'ff36ffffffffffffff0fff3cff32ffff794d4815ffff02ffff6fffff40ffff7d');
