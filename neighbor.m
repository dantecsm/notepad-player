%% 找到数字数组str中最接近num的数字的位置,使用dic(location)可得具体字
function location=neighbor(str,num)
l=length(str);
min=255;
for i=1:l
    temp=abs(str(i)-num);
    if temp<min
        min=temp;
        location=i;
    end
end