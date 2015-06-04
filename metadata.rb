%w(postgresql).each do |cb|
  depends cb
end

depends 'postgresql', '~> 2.3'
depends 'database', '~> 2.3'
