require('open-uri')
require('json')

class HomeController < ApplicationController
  def index
  end

  def show
    @random_num=[]
    @random_num=(1..45).to_a.sample(6).sort
    @drwtNo=[]
    @bnusNo=0
    @count_num=[]#똑같은 번호
    @lotto_hash = JSON.parse(open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=801').read).sort
    
    #drwtNo 로또번호
    @lotto_hash.each do |k,v|
      if k.include?('drwtNo')
        @drwtNo<<v
      end
    end
    
    #bnusNo를 로또번호에 넣음
    @lotto_hash.each do |k,v|
      if k.include?('bnusNo')
        @drwtNo<<v
        @bnusNo=v
      end
    end
    
    
    
    #random번호와 로또번호가 맞으면 count를 세아림
    @count=0
    @drwtNo.each do |q|
      @random_num.each do |w|
        if q==w
          @count = @count+1
          @count_num<<q
        end
      end
    end
    
    @rank=99999
    @include_bnusNo = @random_num.include?(@bnusNo)
    
    if @count==6
      if @include_bnusNo==false
       @rank=1
     else @rank=2
    end
  end
    
    if @count==5
       @rank=3
    end
    
    if @count==4
      @rank=4
    end
    
    if @count==3
      @rank=5
    end
     
  end

  
end
