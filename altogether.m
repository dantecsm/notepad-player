tic
%% ��ȡ��Ƶ����֡
%% �Ľ����������ĳ�����ȣ�����߶Աȶ�
strtmp='para-sol/';
video=VideoReader('op.avi');
counter=0;
for k=1:video.numberofFrame
    counter=counter+1;
    Frame=read(video,k);
    Frame=rgb2gray(Frame);
    Frame=imresize(Frame,[76,186]);
    if k<750 | k>985
    Frame=histeq(Frame);
    end
    str=[strtmp num2str(counter) '.bmp'];
    imwrite(Frame,str);
end
%% ��Ŀ¼�µ����лҶ�ͼ��ת��Ϊ��Ŀ¼�µ��ı�֡
load dictionary;
cd para-sol;
folder='frametxt\';
fidm=fopen([folder 'merge.txt'],'wt');
fprintf(fidm,'%s\n',ones(1,100));
for i=1:counter
    bmpname=[num2str(i) '.bmp'];
    f=imread(bmpname);
    char_pic=dict(double(f)+1);
    for j=1:size(f,1)
        fprintf(fidm,'%s\n',char_pic(j,:));
    end
end
fclose(fidm);
cd ..
tim=toc