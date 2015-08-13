# ~/.profile: executed by the command interpreter for login shells.

# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

################################################################################

# Include everything from ~/.profile.d
if [ -d $HOME/.profile.d ]; then
  for file in $HOME/.profile.d/* ; do
    if [ -r $file ]; then
      . $file
    fi
  done
  unset file
fi
