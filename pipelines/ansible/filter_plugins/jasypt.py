from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from ansible.errors import AnsibleError

try:
    from pysypt import StringEncryptor
    HAS_LIB = True
except ImportError:
    HAS_LIB = False

def jasypt_encrypt(message, algorithm, key):
    enc = StringEncryptor(algorithm=algorithm, key=key)
    return enc.encrypt(message)

def jasypt_decrypt(encrypted, algorithm, key):
    enc = StringEncryptor(algorithm=algorithm, key=key)
    return enc.decrypt(encrypted)

class FilterModule(object):
    ''' Jasypt en/decryption filters '''

    def filters(self):
        if not HAS_LIB:
            raise AnsibleError(
                'You need to install "jasypt4py" prior to running '
                'jasypt filter'
            )

        return {
            'jasypt_encrypt': jasypt_encrypt,
            'jasypt_decrypt': jasypt_decrypt
        }