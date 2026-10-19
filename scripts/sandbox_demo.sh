#!/bin/bash
# Harmless system-observation script for the NPC Capstone lab.
# Does not execute network-received commands or create a remote shell.
LOG="$HOME/npc-capstone/logs/experiment.log"
mkdir -p "$(dirname "$LOG")"
{
    echo "=== NPC Capstone Sandbox Demonstration ==="
    echo "Date: $(date)"
    echo "Process ID: $$"
    echo "Parent Process ID: $PPID"
    echo "Current User: $(whoami)"
    echo "Hostname: $(hostname)"
    echo "System Information:"
    uname -a
    echo
    echo "Relevant Process Information:"
    ps -p $$ -o pid,ppid,user,stat,comm
    echo
    echo "Network Interface Summary:"
    ip -br address
    echo
    echo "=== Demonstration Complete ==="
    echo
} | tee -a "$LOG"
