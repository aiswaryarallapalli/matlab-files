% load the images
 images    = cell(5,1);
 map = colormap(gray(256));%256 as an example.
 images{1} = imread('n1.jpg');
 images{2} = imread('n2.jpg');
 images{3} = imread('n3.jpg');
 images{4} = imread('n4.jpg');
 images{5} = imread('n5.jpg');
 % create the video writer with 1 fps
 writerObj = VideoWriter('myVideo5.avi');
 writerObj.FrameRate = 1;
 % set the seconds per image
 secsPerImage = [5 5 5 5 5];
 % open the video writer
 open(writerObj);
 % write the frames to the video
 for u=1:length(images)
     % convert the image to a frame
     frame = im2frame(images{u},map);
     for v=1:secsPerImage(u) 
         writeVideo(writerObj, frame);
     end
 end
 % close the writer object
 close(writerObj);
 implay('myVideo5.avi');
 

