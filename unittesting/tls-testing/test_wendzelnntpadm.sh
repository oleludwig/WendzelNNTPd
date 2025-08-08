#set -x

check_returncode() {
    actual=$1
    expected=$2
    if [ "$actual" -ne "$expected" ]
    then
        echo "Failure"
        echo "Expected returncode $expected but was $actual"
        echo "Output:"
        echo "$3"
        exit 1
    fi
}

check_output() {
    actual=$1
    expected=$2
    if ! echo "$actual" | grep -q -- "$expected"
    then
        echo "Failure"
        echo
        echo "Expected:"
        echo "$expected"
        echo
        echo "Actual:"
        echo "$actual"
        exit 1
    fi
}

echo "== Test help output without command =="
output=$(wendzelnntpadm 2>&1)
returncode=$?

check_returncode $returncode 1 "$output"
check_output "$output" "usage: wendzelnntpd <command> \[parameters\]"

echo "== Test output for invalid command =="
output=$(wendzelnntpadm invalid invalid 2>&1)
returncode=$?

check_returncode $returncode 1 "$output"
check_output "$output" "Invalid mode: invalid'."

echo "== Test listgroups command =="
output=$(wendzelnntpadm listgroups 2>&1)
returncode=$?

check_returncode $returncode 0 "$output"
check_output "$output" "Newsgroup, Low-, High-Value, Posting-Flag"
check_output "$output" "-----------------------------------------"
check_output "$output" "alt.wendzelnntpd.test 2 1 y"
check_output "$output" "alt.wendzelnntpd.test.empty 0 0 y"
check_output "$output" "alt.wendzelnntpd.test.post 0 0 y"
check_output "$output" "done."

echo "== Test addgroup command =="
output=$(wendzelnntpadm addgroup newgroup n 2>&1)
returncode=$?

check_returncode $returncode 0 "$output"
check_output "$output" "Newsgroup newgroup does not exist. Creating new group."
check_output "$output" "done."

output=$(wendzelnntpadm listgroups 2>&1)
returncode=$?

check_returncode $returncode 0 "$output"
check_output "$output" "Newsgroup, Low-, High-Value, Posting-Flag"
check_output "$output" "-----------------------------------------"
check_output "$output" "alt.wendzelnntpd.test 2 1 y"
check_output "$output" "alt.wendzelnntpd.test.empty 0 0 y"
check_output "$output" "alt.wendzelnntpd.test.post 0 0 y"
check_output "$output" "newgroup 0 0 n"
check_output "$output" "done."

echo "== Test addgroup command but group already exists =="
output=$(wendzelnntpadm addgroup newgroup n 2>&1)
returncode=$?

check_returncode $returncode 1 "$output"
check_output "$output" "Newsgroup newgroup already exists."

echo "== Test modgroup command for existing group =="
output=$(wendzelnntpadm modgroup newgroup y 2>&1)
returncode=$?

check_returncode $returncode 0 "$output"
check_output "$output" "Newsgroup newgroup exists: okay."
check_output "$output" "done."

output=$(wendzelnntpadm listgroups 2>&1)
returncode=$?

check_returncode $returncode 0 "$output"
check_output "$output" "Newsgroup, Low-, High-Value, Posting-Flag"
check_output "$output" "-----------------------------------------"
check_output "$output" "alt.wendzelnntpd.test 2 1 y"
check_output "$output" "alt.wendzelnntpd.test.empty 0 0 y"
check_output "$output" "alt.wendzelnntpd.test.post 0 0 y"
check_output "$output" "newgroup 0 0 y"
check_output "$output" "done."

echo "== Test modgroup command for non existing group =="
output=$(wendzelnntpadm modgroup invalid y 2>&1)
returncode=$?

check_returncode $returncode 1 "$output"
check_output "$output" "Newsgroup invalid does not exists."

output=$(wendzelnntpadm listgroups 2>&1)
returncode=$?

check_returncode $returncode 0 "$output"
check_output "$output" "Newsgroup, Low-, High-Value, Posting-Flag"
check_output "$output" "-----------------------------------------"
check_output "$output" "alt.wendzelnntpd.test 2 1 y"
check_output "$output" "alt.wendzelnntpd.test.empty 0 0 y"
check_output "$output" "alt.wendzelnntpd.test.post 0 0 y"
check_output "$output" "done."

echo "== Test delgroup command for existing group =="
output=$(wendzelnntpadm delgroup newgroup y 2>&1)
returncode=$?

check_returncode $returncode 0 "$output"
check_output "$output" "Newsgroup newgroup exists: okay."
check_output "$output" "Clearing association class ... done"
check_output "$output" "Clearing ACL associations of newsgroup newgroup... done"
check_output "$output" "Clearing ACL role associations of newsgroup newgroup... done"
check_output "$output" "Deleting newsgroup newgroup itself ... done"
check_output "$output" "Cleanup: Deleting postings that do not belong to an existing newsgroup ... done"
check_output "$output" "done."

echo "== Test delgroup command for non existing group =="
output=$(wendzelnntpadm delgroup invalid y 2>&1)
returncode=$?

check_returncode $returncode 1 "$output"
check_output "$output" "Newsgroup invalid does not exists."

#TODO
#listusers
#adduser
#deluser
#listacl
#addacluser
#delacluser
#addaclrole
#delaclrole
#rolegroupconnect
#rolegroupdisconnect
#roleuserconnect
#roleuserdisconnect
