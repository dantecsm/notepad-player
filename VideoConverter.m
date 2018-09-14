load dictionary;    %�����ֵ�
fid=fopen('merge.txt','wt');    %�½��ĵ�
video=VideoReader('op.avi');    %������Ƶ
for k=1:video.numberofFrame
    Frame=read(video,k);    %��ȡ��Ƶ֡
    Frame=rgb2gray(Frame);  %֡ͼͼ����ʼ
    Frame=imresize(Frame,[76,185]);
    Frame=imadjust(Frame,[],[],2.5);
    Frame=histeq(Frame);    %֡ͼͼ�������
    char_pic=dict(double(Frame)+1); %��ͼ֡������ı�֡
    for j=1:size(Frame,1)   %�ı�֡д���ĵ�
        fprintf(fid,'%s\n',char_pic(j,:));
    end
end
fclose(fid);    %�ر��ĵ�