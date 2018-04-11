require('open-uri')
require('json')

class HomeController < ApplicationController
  def index
  end

  def show
    @bon=0
    @num=[]
    @a=[]
    @a=(1..45).to_a.sample(6).sort
    @b=[]
    @lotto_hash = JSON.parse(open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=801').read).sort
    @lotto_hash.each do |k,v|
    if k.include?('drwtNo')
      @b<<v
    end
    end
    @lotto_hash.each do |k,v|
      if k.include?('bnusNo')
        @b<<v
        @bon=v
      end
    end
    @count=0
    @a.each do |q|
      @b.each do |w|
        if q==w
          @count+=1
          @num<<q
        end
      end
    end
    @b.pop
    @count_n=0
    @rank=0
    @a.each do |q|
      @b.each do |w|
        if q==w
          @count_n+=1
        end
      end
    end
    if @count_n == 6
      @rank=1
    end
    
    if @count_n==5
      @rank=3
    end
    
    if @count_n==4
      @rank=4
    end
    
    if @count_n==3
      @rank=5
    end
     
    if @count==6 && @count_n==5
      @rank=2
    end
  end


  
  
end
