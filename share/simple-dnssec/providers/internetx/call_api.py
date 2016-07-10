#!/usr/bin/python
import sys
import urllib2

headers = {'User-Agent': 'simple-dnssec',
            'Content-Type': 'text/xml'}
request = urllib2.Request('https://gateway.autodns.com', data=sys.stdin.read(), headers=headers)
#request.get_method = lambda: 'POST'
transfer = urllib2.urlopen(request, timeout=30)
if transfer.getcode() < 200 or transfer.getcode() >=300:
    raise RuntimeError("wrong http response code received (received: %s, expected: 200-299)" % transfer.getcode())
sys.stdout.write(transfer.read())