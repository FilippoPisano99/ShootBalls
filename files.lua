function readParam(riga,key)
	k = readLine()
	k[riga] = string.gsub(k[riga] , key,"")
	return k[riga]
end


function readLine()
  lines = {}
  for line in io.lines("data.dat") do
    lines[#lines + 1] = line
  end
  return lines
end
