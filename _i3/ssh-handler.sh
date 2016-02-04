#!/bin/bash
#
# This script is a handler for ssh:// urls. It will open the requested ssh
# connection in a new floating window.
#

# TODO: better argument handling ?
# Arguments handling
CONNECTION_STRING=${1#ssh://}

i3-msg append_layout ~/.i3/ssh-handler.json
gnome-terminal -e "ssh $CONNECTION_STRING"

