fid=fopen('hz.txt','r');
str=fscanf(fid,'%s');

%�������ֿ⹹��20920�����ַ����ļ�
% for i=1:length(str)
%     char=str(i);
%     char=repmat(char,40,40);
%     filename=[num2str(i) '.txt'];
%     fid=fopen(filename,'wt');
% for j=1:40
%     fprintf(fid,'%s\n',char(j,:));
% end
% fclose(fid);
% end

cb=zeros(1,20902);
[m n]=size(rgb2gray(imread('1.png')));
total=m*n*255;
for i=1:20902
    filename=[num2str(i) '.png'];
    f=imread(filename);
    g=rgb2gray(f);
    cb(i)=total-sum(g(:));
end
std=255-cb*255/max(cb);
dict=[];
% ע��dict(1-256)�ֱ����0-255ɫ�Ҷ�
for i=0:255
    dict=[dict str(neighbor(std,i))];
end
% ��ȷ��У�ԣ�ע���һ�Ŷ�׼�Ҷ�ֵ0
stat=[];
for i=1:256
    stat=[stat std(str==dict(i))];
end
eval=0:255;
eval=abs(eval-stat);
correctness=sum(eval(:));
sum(eval<0.5)