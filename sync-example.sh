#!/bin/bash

echo
echo "follow script will sync srv1 email to srv2 backup mail server"
echo

function docmd()
{
        echo "========================================================================"
        echo
        echo "---> running : docker exec imapsync bash -c \"$*\""
        echo

        docker exec imapsync bash -c "$*"
}

mailsize_before=$(du -sm /nas/data/mail | awk '{print $1}')
mailcount_before=$(find /nas/data/mail | wc -l)

# user@srv1.com
docmd "imapsync " \
        "--host1 imaps.srv1.com --user1 user@srv1.com --passfile1 /security/mail_srv1/user@srv1.com " \
        "--host2 imaps.srv2.com --user2 user@srv2.com --passfile2 /security/mail_srv2/user@srv2.com --delete2"

mailsize_after=$(du -sm /nas/data/mail | awk '{print $1}')
mailcount_after=$(find /nas/data/mail | wc -l)

cat > /status/mailsync.json << EOF
{
        date: "$(date +%Y.%m.%d-%H.%M.%S)",

        mailsize_before: $mailsize_before,
        mailcount_before: $mailcount_before,

        mailsize_after: $mailsize_after,
        mailcount_after: $mailcount_after
}
EOF
