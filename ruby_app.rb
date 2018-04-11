require('open-uri')
require('json')

b=[]
lotto_hash = JSON.parse(open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=801').read).sort
lotto_hash.each do |k,v|
if k.include?('drwtNo')
b<<v
end
end
print b