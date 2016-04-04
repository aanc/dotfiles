#!/bin/sh

inboxMailCount=$(ls ~/Mail/*/INBOX/new/* ~/Mail/*/INBOX/cur/* | wc -l)
echo "Inbox:$inboxMailCount"
