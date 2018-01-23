import urllib
import urllib2
import re

url = 'http://www.qiushibaike.com/'
user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36'
headers = { 'User-Agent' : user_agent }
try:
    request = urllib2.Request(url,headers = headers)
    response = urllib2.urlopen(request)
    content = response.read().decode('utf-8')
    items = re.findall('<div class="content">(.*?)</div>',content,re.S)
    num=1
    for item in items:
        print str(num) +'. ' + item +'\n'
        num += 1

except urllib2.URLError, e:
    if hasattr(e,"code"):
        print e.code
    if hasattr(e,"reason"):
        print e.reason
