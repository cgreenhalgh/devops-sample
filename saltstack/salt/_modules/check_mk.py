#!/usr/bin/env python
'''Support for running check_mk or check_mk_agent over salt'''
import os
import salt.utils
from salt.exceptions import SaltException

def __virtual__():
    ''' Only load the module if check-mk-agent is installed '''
    if os.path.exists('/usr/bin/check_mk_agent') or os.path.exists('/usr/bin/check_mk'):
        return 'check_mk'
    return False

def agent():
    ''' Return the output of check_mk_agent '''
    if not os.path.exists('/usr/bin/check_mk_agent'):
        return False
    return __salt__['cmd.run']('/usr/bin/check_mk_agent')

def inspect():
    ''' Run check_mk -I to look for changes '''
    if not os.path.exists('/usr/bin/check_mk'):
        return False
    return __salt__['cmd.run']('/usr/bin/check_mk -I')

def update():
    ''' Run check_mk -O to update nagios '''
    if not os.path.exists('/usr/bin/check_mk'):
        return False
    return __salt__['cmd.run']('/usr/bin/check_mk -O')

