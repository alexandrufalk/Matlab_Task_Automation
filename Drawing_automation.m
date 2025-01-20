%% ------------------- Importing Libraries --------------------------------
clear all;
import java.awt.Robot;
import java.awt.event.*;

robot = java.awt.Robot();
cleanupObj = onCleanup(@() robot.mouseRelease(KeyEvent.BUTTON1_MASK));

%---------- Open Paint Automatically -------------------------------------
disp('Opening Paint...');
system('mspaint.exe &'); % Launch Microsoft Paint
pause(2); % Allow Paint to fully load

%---------- Open the Image Automatically ---------------------------------
[fileName, filePath] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files'}, 'Select an Image to Draw');
if isequal(fileName, 0)
    disp('No file selected. Exiting...');
    return;
end
disp('Opening Image...');
image = imread(fullfile(filePath, fileName)); % Load the selected image
image1 = imresize(im2bw(image), 0.5); % Convert to black-and-white and downsize for faster drawing
imshow(image1); % Display the image for reference
pause(2); % Allow time to preview the image

%---------- Move Mouse to Default Paint Canvas Position ------------------
disp('Positioning mouse on Paint canvas...');
Screen_size = get(0, 'ScreenSize'); % Get screen resolution
canvas_loc = [Screen_size(3) / 3, Screen_size(4) / 3]; % Default canvas position (adjust if needed)
robot.mouseMove(canvas_loc(1), canvas_loc(2)); % Move mouse to canvas
pause(1);

%---------- Draw Image in Paint ------------------------------------------
[rows, columns] = size(image1);
h = waitbar(0, 'Drawing in progress...');
disp('Drawing started...');
for i = 1:rows
    waitbar(i / rows, h);
    for j = 1:columns
        if image1(i, j) == 0
            robot.mouseMove(canvas_loc(1) + j, canvas_loc(2) + i);
            robot.mousePress(KeyEvent.BUTTON1_MASK);
            robot.mouseRelease(KeyEvent.BUTTON1_MASK);
        end
    end
end
close(h);
disp('Drawing completed!');
