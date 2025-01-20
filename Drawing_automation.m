%% ------------------- Importing Libraries --------------------------------
clear all;
import java.awt.Robot;
import java.awt.event.*;

robot = java.awt.Robot();
cleanupObj = onCleanup(@() robot.mouseRelease(KeyEvent.BUTTON1_MASK));

%---------- Open Paint Automatically -------------------------------------
disp('Opening Paint...');
system('mspaint.exe &'); % Launch Microsoft Paint
pause(2); % Allow time for Paint to open

%---------- Position Mouse on Canvas Dynamically -------------------------
disp('Hover over the Paint canvas and press Enter...');
pause; % Wait for user action to hover over Paint
Loc_paint = get(0, 'PointerLocation');

%---------- Load and Process Image ---------------------------------------
[fileName, filePath] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files'});
if isequal(fileName, 0)
    disp('No file selected. Exiting...');
    return;
end
image = imread(fullfile(filePath, fileName));
image1 = imresize(im2bw(image), 0.5); % Downsample for faster drawing
imshow(image1);

%---------- Draw Image in Paint ------------------------------------------
[rows, columns] = size(image1);
h = waitbar(0, 'Drawing in progress...');
for i = 1:rows
    waitbar(i / rows, h);
    for j = 1:columns
        if image1(i, j) == 0
            robot.mouseMove(Loc_paint(1) + j, Loc_paint(2) + i);
            robot.mousePress(KeyEvent.BUTTON1_MASK);
            robot.mouseRelease(KeyEvent.BUTTON1_MASK);
        end
    end
end
close(h);

disp('Drawing completed!');
