
path='D:\gray\myVideo5.avi';
vidObj = VideoReader(path);
vidObj.CurrentTime = 0.5;
vidframes = read(vidObj,[10 24]);
%imshow(vidframes);
implay(vidframes);