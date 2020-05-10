
path='D:\gray\myVideo5.avi';
vidObj = VideoReader(path);
vidObj.CurrentTime = 0.5;
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    imshow(vidFrame)
    pause(1/vidObj.FrameRate);
end