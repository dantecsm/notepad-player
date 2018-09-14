load dictionary;    %读入字典
video=VideoReader('op.avi');    %读入视频
mkdir('test');
copyfile('dosplayer.cmd','.\test\dosplayer.cmd');
cd test;
for k=1:video.numberofFrame
    fid=fopen([num2str(k) '.txt'],'wt');
    Frame=read(video,k);    %提取视频帧
    Frame=rgb2gray(Frame);  %帧图图像处理开始
    Frame=imresize(Frame,[40,80]);
    Frame=imadjust(Frame,[],[],2.5);
    Frame=histeq(Frame);    %帧图图像处理结束
    char_pic=dict(double(Frame)+1); %将图帧翻译成文本帧
    for j=1:size(Frame,1)   %文本帧写入文档
        fprintf(fid,'%s\n',char_pic(j,:));
    end
    fclose(fid);    %关闭文档
end