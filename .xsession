# This script contains user customizations for X session.
# LightDM sources this file from /etc/lightdm/Xsession.

# If running as a VirtualBox guest, load guest additions.
if grep -q "^flags.*hypervisor" /proc/cpuinfo && [ -x "$(which VBoxClient-all)" 2>/dev/null ] ; then
    VBoxClient-all
fi
