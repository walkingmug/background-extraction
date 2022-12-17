close all;
clear;
clc;

% read video
video_input = VideoReader('700.mp4');

% extract every n-th frame
frames_to_skip = 20;
nr_extracted_frames = round(video_input.NumFrames/frames_to_skip);
size_video_input = size(read(video_input,1));
extracted_frames = zeros(size_video_input(1),size_video_input(2),3, ...
    nr_extracted_frames);
i=1;
for frame=1:20:video_input.NumFrames
    extracted_frames(:,:,:,i) = read(video_input,frame);
    i=i+1;
end

% find median value of each pixel along all frames
median_array = zeros(nr_extracted_frames,3);
bkg_construct = zeros(size_video_input(1),size_video_input(2),3);
% for each pixel
for row = 1:size_video_input(1)
    for col = 1:size_video_input(2)
        % for each frame containing this pixel
        for frame = 1:nr_extracted_frames
            % append pixel's RGB value to array
            median_array(frame,:) = extracted_frames(row,col,:,frame);
        end
        % get the median of array and set the new pixel to this value
        bkg_construct(row,col,1) = median(median_array(:,1));
        bkg_construct(row,col,2) = median(median_array(:,2));
        bkg_construct(row,col,3) = median(median_array(:,3));
    end
end

% save result to file and show
figure('Name', 'Reconstructed background');
imwrite(uint8(bkg_construct), 'output.png');
imshow(uint8(bkg_construct));