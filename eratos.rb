#!env ruby

usage = <<"USAGE"
Usage:   #{$0} NUMBER (NUMBER >= 2)
Example: #{$0} 100
USAGE

if ARGV.size != 1 || !ARGV.all?{|v| /^\d+$/.match(v)}
  puts usage
  exit
end

max, = ARGV.map{|v| v.gsub(/,/, '').to_i}

if max < 2
  puts usage
  exit
end

max_head = Math.sqrt(max)
explores = (2..max).to_a
primes = []

while explores[0] < max_head do
  head = explores.shift
  primes << head
  explores = explores.select {|item| item % head != 0}
end

primes << explores
puts primes

