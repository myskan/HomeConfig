shopt -s nocasematch
if [[ $OS == *Windows* ]] 
   then
      export IS_WINDOWS="TRUE"
fi
shopt -u nocasematch

if [ -f ~/.bashrc ]; then  
  . ~/.bashrc
fi

# Don't do any of the rest on Windows
# SSH Stuff 
function checkssh() {
   if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        SESSION_TYPE=remote/ssh
   else
         case $(ps -o comm= -p $PPID) in sshd|*/sshd) SESSION_TYPE=remote/ssh;;
      esac
   fi
}

if [[ ! $OS == *Windows* ]]
   then
      checkssh
fi
