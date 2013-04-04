# Load file A.txt
if File.exists?('A.txt')
  a = File.open('A.txt').read.split(/\n/).to_a
else
  raise "There is no file named A.txt in the working directory."
end

# Load file B.txt
if File.exists?('B.txt')
  b = File.open('B.txt').read.split(/\n/).to_a
else
  raise "There is no file named B.txt in the working directory."
end

# Load file C.txt
c = Array.new
if File.exist?('C.txt')
  c = File.open('C.txt').read.split(/\n/).to_a
end

# These are the output arrays that will be written to the final output file
leading_a_output = Array.new
leading_b_output = Array.new
leading_c_output = Array.new

# Keyword permutations beginning with file A
a.each do |f|
  b.each do |g|
    if c.empty?
      leading_a_output.push(f+" "+g+"\n")
    else
      c.each do |h|
        leading_a_output.push(f+" "+g+" "+h+"\n")
      end
    end
  end
  
  unless c.empty?
    c.each do |g|
      b.each do |h|
        leading_a_output.push(f+" "+g+" "+h+"\n")
      end
    end
  end

end

# Keyword permutations beginning with file B
b.each do |f|
  a.each do |g|
    if c.empty?
      leading_b_output.push(f+" "+g+"\n")
    else
      c.each do |h|
        leading_b_output.push(f+" "+g+" "+h+"\n")
      end
    end
  end
  
  unless c.empty?
    c.each do |g|
      a.each do |h|
        leading_b_output.push(f+" "+g+" "+h+"\n")
      end
    end
  end

end


# Keyword permutations beginning with file C
unless c.empty?
  c.each do |f|
    a.each do |g|
      b.each do |h|
        leading_c_output.push(f+" "+g+" "+h+"\n")
      end
    end
  end
    
  c.each do |f|
    b.each do |g|
      a.each do |h|
        leading_c_output.push(f+" "+g+" "+h+"\n")
      end
    end
  end
end

File.open("output.txt", "w") do |file|
  file.puts leading_a_output
  file.puts leading_b_output
  file.puts leading_c_output
end

puts "Awesome! Your permutations are now in this file called output.txt"