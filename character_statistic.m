fid=fopen('hz.txt','r');
str=fscanf(fid,'%s');

%按汉字字库构造20920个汉字方块文件
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
% 注：dict(1-256)分别代表0-255色灰度
for i=0:255
    dict=[dict str(neighbor(std,i))];
end
% 正确性校对：注意第一号对准灰度值0
stat=[];
for i=1:256
    stat=[stat std(str==dict(i))];
end
eval=0:255;
eval=abs(eval-stat);
correctness=sum(eval(:));
sum(eval<0.5)