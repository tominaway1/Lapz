#!/bin/bash                                                                      
set -e    
ansible-playbook ./playbook.yml --tags "rsync" -i inventory
