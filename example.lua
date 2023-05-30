file=io.open([[C:\Users\learn\Desktop\map.txt]])
io.input(file)
i=1
map={}
while i~=nil do i=io.read() table.insert(map,i) end

A={}

for y=1,#map do
for x=1,#map[1] do
if string.sub(map[y],x,x)=="A" then table.insert(A,{x,y}) end
end
end

B={}

for y=1,#map do
for x=1,#map[1] do
if string.sub(map[y],x,x)=="B" then table.insert(B,{x,y}) end
end
end

require("neo")

neo=NeuralNetwork.create(2,1,4,4,.3)
---[[
i=0
while true do i=i+1
neo:backwardPropagate(A[1],{1})
neo:backwardPropagate(A[2],{1})
neo:backwardPropagate(A[3],{1})
neo:backwardPropagate(A[4],{1})

neo:backwardPropagate(B[1],{0})
neo:backwardPropagate(B[2],{0})
neo:backwardPropagate(B[3],{0})
neo:backwardPropagate(B[4],{0})

if i%1000==0 then

os.execute("cls")
print(i)

for y=1,#map do
text=""
for x=1,#map[1] do
temp=" "
if string.sub(map[y],x,x)=="B" then temp="B " 
elseif string.sub(map[y],x,x)=="A" then temp="A " 
else temp=math.floor(tostring(neo:forewardPropagate(x,y)[1])+.5)..temp end
text=text..temp
end
print(text)
end

end

end
--]]
