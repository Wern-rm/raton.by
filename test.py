import hashlib
from datetime import datetime
import os


def generate() -> str:
    date = str(datetime.now())
    key = str(os.urandom(48))[2:-1].replace('\\x', '')
    new_token = hashlib.md5(str(date + key).encode()).hexdigest()
    return new_token


print(
generate())