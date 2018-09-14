%% 将目录下的所有灰度图像转化为子目录下的文本帧
load all4;
cd para-sol;
folder='frametxt\';
fidm=fopen([folder 'merge.txt'],'wt');
for i=1:video.numberofFrame
    bmpname=[num2str(i) '.bmp'];
    txtname=[folder num2str(i) '.txt'];
    f=imread(bmpname);
    f=imresize(f,[76,186]);
    [m n]=size(f);
    char_pic=dict(double(f)+1);
    fid=fopen(txtname,'wt');
    for j=1:m
        fprintf(fid,'%s\n',char_pic(j,:));
        fprintf(fidm,'%s\n',char_pic(j,:));
    end
        if i==1
        fprintf(fid,'%s\n',ones(1,100));
        fprintf(fidm,'%s\n',ones(1,100));
        end
    fclose(fid);
end
fclose(fidm);