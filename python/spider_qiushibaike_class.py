#coding=utf-8

import urllib2
import re

class Sub:    
  replaceBr = re.compile('<br/>')    
  def replace(self,x):        
    x = re.sub(self.replaceBr,"\n",x)
    return x.strip()
  
class Spider:
  def __init__(self):             
    self.page = 1
    self.pages = []             
    self.enable = False             
    self.sub = Sub()
  
  def getPage(self):
    sUrl = "http://www.qiushibaike.com/"
    userAgent = 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)'
    headers = { 'User-Agent': userAgent}
    request = urllib2.Request(sUrl, headers=headers)
    response = urllib2.urlopen(request)
    sPage = response.read()
    unicodePage = sPage.decode("utf-8")
    myItems = re.findall('<div class="content">(.*?)</div>',unicodePage,re.S)
    num=1
    for item in myItems:
        print str(num) +'. ' + self.sub.replace(item) +'\n'
        num += 1
    return None

model = Spider()
model.getPage()