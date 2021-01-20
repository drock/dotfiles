#assumes homebrew openssh is installed and a launchctl plist is setup to have its ssh-agent running
#vs the built in macos ssh-agent.  Below will determine the socket that is being used by that process
#and set SSH_AUTH_SOCK to that so that ssh-add can use it.

#I run this configuration for security.  I configure the launchctl for the homebrew ssh-agent
#to use the -t option with short timeframe.  This is because when you add a key to ssh-agent
#it remembers the passphrase in memory and will not ask you for it again.  Thus if I add an important
#key to ssh-agent and someone gains access to my workstation, they can then use the key unchallenged
#this option will expire the key out after some time forcing me to re-add it (and re-enter the passphrase)

#NOTE: I haven't yet figured out how to automate the setup of the launchctl stuff so that is manually done for now

# Discover the running ssh-agent started by launchd
#export SSH_AGENT_PID=$(pgrep -U $USER ssh-agent)
#if [ -n "$SSH_AGENT_PID" ]; then
#    export SSH_AUTH_SOCK=$(lsof -U -a -p $SSH_AGENT_PID -F n | grep '^n/' | cut -c2-)
#else
#    echo "No running ssh-agent found.  Check your launchd service."
#fi