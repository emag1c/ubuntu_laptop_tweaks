#!/bin/sh
#
# THIS FILE SHOULD BE ADDED to /etc/acpi directory with executable permissions!
#
#
# To finish set up add the following to /etc/acpi/events/lm_lid
# event=button/lid.*
# action=/etc/acpi/lid.sh
# 

grep -q close /proc/acpi/button/lid/*/stateif [ $? = 0 ]; then
    # change this dir to reflect dir that this repo is in
    /opt/erics_tweaks/acpi/lid_close.sh
fi
grep -q open /proc/acpi/button/lid/*/state
if [ $? = 0 ]; then
    /opt/erics_tweaks/acpi/lid_open.sh
fi