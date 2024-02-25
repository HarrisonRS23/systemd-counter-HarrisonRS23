import unittest
from counter import open_file

def test_open_file():
    assert open_file() == open('/tmp/currentCount.out' , 'w')
