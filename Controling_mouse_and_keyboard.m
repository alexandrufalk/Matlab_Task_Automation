%%----------- Importing the java classes ------

% import java.awt.Robot;
% import java.awt.event.*;
% robot=java.awt.Robot();
% keyEvent = java.awt.event.KeyEvent;

% robot.delay(2000);  %  time to click on the notepad and focus it.
%% -------------- Writing to Notepad -----------

% robot.keyPress(KeyEvent.VK_H);
% robot.keyRelease(KeyEvent.VK_H);



% arrayfun(@(x) robot.keyPress(java.awt.event.KeyEvent.getExtendedKeyCodeForChar(x)), int32('Hello'));

% for ch = 'Hello'
%     keyCode = java.awt.event.KeyEvent.getExtendedKeyCodeForChar(ch);
%     robot.keyPress(keyCode);
%     robot.keyRelease(keyCode);
% end
import java.awt.Robot;
import java.awt.event.KeyEvent;

% Custom sleep function
pause_time = @(ms) pause(ms / 1000);

% Open Notepad
system('notepad.exe &');
pause_time(2000); % Wait for 2 seconds to allow Notepad to open

% Create an instance of the Robot class
robot = Robot();

% Manual mapping of characters to KeyEvent.VK_* constants
keyMap = containers.Map( ...
    {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', ...
     'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ...
     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', ...
     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ...
     ' '}, ...
    [KeyEvent.VK_A, KeyEvent.VK_B, KeyEvent.VK_C, KeyEvent.VK_D, KeyEvent.VK_E, ...
     KeyEvent.VK_F, KeyEvent.VK_G, KeyEvent.VK_H, KeyEvent.VK_I, KeyEvent.VK_J, ...
     KeyEvent.VK_K, KeyEvent.VK_L, KeyEvent.VK_M, KeyEvent.VK_N, KeyEvent.VK_O, ...
     KeyEvent.VK_P, KeyEvent.VK_Q, KeyEvent.VK_R, KeyEvent.VK_S, KeyEvent.VK_T, ...
     KeyEvent.VK_U, KeyEvent.VK_V, KeyEvent.VK_W, KeyEvent.VK_X, KeyEvent.VK_Y, ...
     KeyEvent.VK_Z, KeyEvent.VK_A, KeyEvent.VK_B, KeyEvent.VK_C, KeyEvent.VK_D, ...
     KeyEvent.VK_E, KeyEvent.VK_F, KeyEvent.VK_G, KeyEvent.VK_H, KeyEvent.VK_I, ...
     KeyEvent.VK_J, KeyEvent.VK_K, KeyEvent.VK_L, KeyEvent.VK_M, KeyEvent.VK_N, ...
     KeyEvent.VK_O, KeyEvent.VK_P, KeyEvent.VK_Q, KeyEvent.VK_R, KeyEvent.VK_S, ...
     KeyEvent.VK_T, KeyEvent.VK_U, KeyEvent.VK_V, KeyEvent.VK_W, KeyEvent.VK_X, ...
     KeyEvent.VK_Y, KeyEvent.VK_Z, KeyEvent.VK_SPACE]);

% The string to type
str = 'Hello ';

% Iterate through each character in the string
for i = 1:length(str)
    charToType = str(i);

    % Check if the current character is uppercase
    if isstrprop(charToType, 'upper')
        % Press the Shift key
        robot.keyPress(KeyEvent.VK_SHIFT);
    end

    % Get the key code for the character from the map
    keyCode = keyMap(charToType);

    % Press and release the character
    robot.keyPress(keyCode);
    robot.keyRelease(keyCode);

    % If Shift was pressed, release it
    if isstrprop(charToType, 'upper')
        robot.keyRelease(KeyEvent.VK_SHIFT);
    end

    % Add a 200ms delay
    pause_time(200);
end

% Ensure all keys are released (failsafe)
robot.keyRelease(KeyEvent.VK_SHIFT);



