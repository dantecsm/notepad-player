load dictionary;    %读入字典
fid=fopen('merge.txt','wt');    %新建文档
video=VideoReader('op.avi');    %读入视频
for k=1:video.numberofFrame
    Frame=read(video,k);    %提取视频帧
    Frame=rgb2gray(Frame);  %帧图图像处理开始
    Frame=imresize(Frame,[76,185]);
    Frame=imadjust(Frame,[],[],2.5);
    Frame=histeq(Frame);    %帧图图像处理结束
    char_pic=dict(double(Frame)+1); %将图帧翻译成文本帧
    for j=1:size(Frame,1)   %文本帧写入文档
        fprintf(fid,'%s\n',char_pic(j,:));
    end
end
fclose(fid);    %关闭文档