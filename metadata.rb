%w(postgresql).each do |cb|
  depends cb
end

depends 'postgresql'
depends 'database'
