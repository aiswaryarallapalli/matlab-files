ath='D:\gray\myVideo5.avi';
vidObj = VideoReader(path);
vidObj.CurrentTime = 0.6;
k = 1;
while vidObj.CurrentTime <= 10
    s(k).cdata = readFrame(vidObj);
    k = k+1;
end
for i=1:length(s)
    imshow(s(i).cdata);
    str=['Image',num2str(i)];
    title(str);
    pause(1);
end