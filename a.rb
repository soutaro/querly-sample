class Error < Exception
end

raise Error

def write(message, io=STDOUT)
  io.puts(message)
end

puts "hogehoge"

io = File.open("foo.txt")

write "Hello world", io

io.close
