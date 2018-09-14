load dictionary;    %�����ֵ�
video=VideoReader('op.avi');    %������Ƶ
mkdir('test');
copyfile('dosplayer.cmd','.\test\dosplayer.cmd');
cd test;
for k=1:video.numberofFrame
    fid=fopen([num2str(k) '.txt'],'wt');
    Frame=read(video,k);    %��ȡ��Ƶ֡
    Frame=rgb2gray(Frame);  %֡ͼͼ����ʼ
    Frame=imresize(Frame,[40,80]);
    Frame=imadjust(Frame,[],[],2.5);
    Frame=histeq(Frame);    %֡ͼͼ�������
    char_pic=dict(double(Frame)+1); %��ͼ֡������ı�֡
    for j=1:size(Frame,1)   %�ı�֡д���ĵ�
        fprintf(fid,'%s\n',char_pic(j,:));
    end
    fclose(fid);    %�ر��ĵ�
end