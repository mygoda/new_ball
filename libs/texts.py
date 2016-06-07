# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function


import re

def text_length(text):

    # First find all 'normal' words and interpunction
    # '[\x21-\x2f]' includes most interpunction, change it to ',' if you only need to match a comma
    count = len(re.findall(r'\w+|[\x21-\x2f]', text))

    for word in text:
        for ch in word:
            # see http://stackoverflow.com/a/11415841/1248554 for additional ranges if needed
            if 0x4e00 < ord(ch) < 0x9fcc:
                count += 1

    return count