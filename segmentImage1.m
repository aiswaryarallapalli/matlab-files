function [BW,maskedImage] = segmentImage1(RGB)
%segmentImage Segment image using auto-generated code from imageSegmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the imageSegmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 12-Mar-2020
%----------------------------------------------------


% Convert RGB image into L*a*b* color space.
X = rgb2lab(RGB);

% Graph cut
foregroundInd = [126854 131469 135508 140124 144164 145896 147049 148204 149357 278287 278862 279438 280592 281748 282906 286370 290413 292146 292725 293302 364940 364942 364945 364954 364968 366134 366148 367311 368466 369045 369047 369049 370207 370787 371367 372522 372523 ];
backgroundInd = [30592 30593 30594 31176 31753 35790 40418 46790 49693 52595 53756 54343 54927 54930 79749 79756 79770 82088 82105 83844 83854 83864 83870 83879 83885 83887 83898 83900 103962 103966 103972 105128 108598 113795 121303 140921 149571 155913 157643 188089 ];
L = superpixels(X,3049,'IsInputLab',true);

% Convert L*a*b* range to [0 1]
scaledX = prepLab(X);
BW = lazysnapping(scaledX,L,foregroundInd,backgroundInd);

% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

function out = prepLab(in)

% Convert L*a*b* image to range [0,1]
out = in;
out(:,:,1) = in(:,:,1) / 100;  % L range is [0 100].
out(:,:,2) = (in(:,:,2) + 86.1827) / 184.4170;  % a* range is [-86.1827,98.2343].
out(:,:,3) = (in(:,:,3) + 107.8602) / 202.3382;  % b* range is [-107.8602,94.4780].

end
