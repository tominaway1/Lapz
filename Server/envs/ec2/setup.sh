#!/bin/bash                                                                      
set -e    
ansible-playbook ./playbook.yml -i ./inventory

