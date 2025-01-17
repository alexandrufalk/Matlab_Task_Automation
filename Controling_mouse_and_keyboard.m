%%----------- Importing the java classes ------

% import java.awt.Robot;
% import java.awt.event.*;
% robot=java.awt.Robot();
% keyEvent = java.awt.event.KeyEvent;

robot.delay(2000);  %  time to click on the notepad and focus it.
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

% The string to type
str = 'Hello from GeeksforGeeks';

% Iterate through each character in the string
for i = 1:length(str)
    charToType = str(i);
    
    % Check if the current character is uppercase
    if isstrprop(charToType, 'upper')
        % Press the Shift key
        robot.keyPress(KeyEvent.VK_SHIFT);
        
        % Press the current character
        robot.keyPress(java.awt.event.KeyEvent.getExtendedKeyCodeForChar(charToType));
        robot.keyRelease(java.awt.event.KeyEvent.getExtendedKeyCodeForChar(charToType));
        
        % Release the Shift key
        robot.keyRelease(KeyEvent.VK_SHIFT);
    else
        % Press and release the character
        robot.keyPress(java.awt.event.KeyEvent.getExtendedKeyCodeForChar(charToType));
        robot.keyRelease(java.awt.event.KeyEvent.getExtendedKeyCodeForChar(charToType));
    end
    
    % Add a 200ms delay
    pause_time(200);
end




