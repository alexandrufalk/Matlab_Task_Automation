import java.awt.Robot;
import java.awt.event.KeyEvent;

%Open app
disp('Open app...');
%system('"C:\Program Files\Google\Chrome\Application\chrome.exe"');

Screen_size = get(0, 'ScreenSize'); % Get screen resolution
loc = [Screen_size(3) / 3, Screen_size(4) / 3] %where to move the mouse
%view mouse position

% while 1
%     % Get the current mouse position
%     C = get(gca, 'CurrentPoint');
% 
%     % Wait for a button press
%     keyPress = waitforbuttonpress;
% 
%     if keyPress  % If a key was pressed
%         % Get the character of the key pressed
%         key = get(gcf, 'CurrentKey');
% 
%         % Check if the pressed key is 'e'
%         if strcmp(key, 'e')
%             disp('Exit');
%             break;  % Exit the loop
%         end
%     end
% end

% % Create a figure window
% figure;
% 
% % Get the screen resolution (width and height in pixels)
% screenRes = get(0, 'ScreenSize');  % [left bottom width height]
% screenWidth = screenRes(3);  % Screen width
% screenHeight = screenRes(4);  % Screen height
% 
% % Display initial screen resolution
% disp(['Screen Resolution: ', num2str(screenWidth), ' x ', num2str(screenHeight)]);
% 
% while true
%     % Wait for a button press (either key press or mouse click)
%     keyPress = waitforbuttonpress;
% 
%     if keyPress  % If a key was pressed
%         % Get the character of the key pressed
%         key = get(gcf, 'CurrentKey');
% 
%         % Get the mouse position in the figure window
%         mousePos = get(gcf, 'CurrentPoint');
% 
%         % Get the position of the figure window on the screen
%         figPos = get(gcf, 'Position');  % [left bottom width height]
% 
%         % Calculate the mouse position relative to the entire screen
%         screenX = figPos(1) + mousePos(1);  % X position on screen
%         screenY = figPos(2) + mousePos(2);  % Y position on screen
% 
%         % Display the key pressed and the mouse position (relative to figure)
%         disp(['Key Pressed: ', key]);
%         disp(['Mouse Position (relative to figure): X = ', num2str(mousePos(1)), ', Y = ', num2str(mousePos(2))]);
% 
%         % Display the mouse position relative to the screen
%         disp(['Mouse Position (relative to screen): X = ', num2str(screenX), ', Y = ', num2str(screenY)]);
% 
%         % Check if the mouse position is inside the screen bounds
%         if screenX >= 0 && screenX <= screenWidth && screenY >= 0 && screenY <= screenHeight
%             disp('Mouse is inside the screen bounds.');
%         else
%             disp('Mouse is outside the screen bounds.');
%         end
% 
%         % Check if the pressed key is 'e'
%         if strcmp(key, 'e')
%             disp('Exit');
%             break;  % Exit the loop if 'e' is pressed
%         end
%     end
% end
% 
% 
% 
% 
% robot.mouseMove(loc(1),loc(2)); %move mouse
% 
% disp(Screen_size)
% 
% t = timer('ExecutionMode', 'fixedRate', ...
%           'Period', 0.1, ...
%           'TasksToExecute', 50, ... 
%           'TimerFcn', @(~,~) fprintf('(X, Y) = (%g, %g)\n', get(0, 'PointerLocation') * 1.5));
% start(t);  %will display mouse movements for 5 seconds

% Create a figure window
f = figure;

% Variable to store mouse position when 'e' is pressed
savedMousePos = [];

% Define the timer for periodically getting the mouse position
t = timer('ExecutionMode', 'fixedRate', ...
          'Period', 0.1, ...  % Display mouse position every 0.1 seconds
          'TasksToExecute', Inf, ...  % Run indefinitely
          'TimerFcn', @(~,~) fprintf('(X, Y) = (%g, %g)\n', get(0, 'PointerLocation')));

% Start the timer
start(t);

% Wait for key press to save mouse position and stop the timer
disp('Press "e" to save the current mouse position.');

while true
    keyPress = waitforbuttonpress;  % Wait for a key press
    
    if keyPress  % If a key was pressed
        key = get(f, 'CurrentKey');
        
        if strcmp(key, 'e')  % If 'e' key is pressed
            % Get the current mouse position and save it to the variable
            savedMousePos = get(0, 'PointerLocation');  % Save the mouse position (X, Y)
            disp(['Mouse position saved: (X, Y) = (', num2str(savedMousePos(1)), ', ', num2str(savedMousePos(2)), ')']);
            
            % Stop the timer as we are done
            stop(t);
            break;  % Exit the loop
        end
    end
end

% Display the saved mouse position after 'e' is pressed
disp(['Final saved mouse position: (X, Y) = (', num2str(savedMousePos(1)), ', ', num2str(savedMousePos(2)), ')']);
