#!/usr/bin/env python3

import os
import sys
import re
import pkgutil

def desensitize(s):
    if len(s) <= 0:
        return ''
    elif len(s) <= 4:
        return '*' * len(s)
    elif len(s) <= 6:
        m = '*' * (len(s) - 4)
        return s[:2] + m + s[-2:]
    else:
        m = '*' * (len(s) - 6)
        return s[:3] + m + s[-3:]

if __name__ == '__main__':
    print('Python version: %s\n' % (sys.version))

    loaded_modules = [ x for x in sys.modules.keys() if not x.startswith('_') ]
    print('Loaded modules: %s\n' % (', '.join(sorted(loaded_modules))))

    available_modules = [x for _, x, _ in pkgutil.iter_modules() if not x.startswith('_')]
    print('Available modules: %s\n' % (', '.join(sorted(available_modules))))

    print('Environment variables:')
    for key, value in os.environ.items():
        if re.match(r'.*(AK|SK|KEY|ACCESS|SECRET|PASS).*', key):
            print('  %s: %s (desensitized)' % (key, desensitize(value)))
        else:
            print('  %s: %s' % (key, value))
