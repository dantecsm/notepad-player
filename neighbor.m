%% �ҵ���������str����ӽ�num�����ֵ�λ��,ʹ��dic(location)�ɵþ�����
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