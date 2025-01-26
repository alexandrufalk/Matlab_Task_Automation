% Scenario: Create a diary which will keep record of all the command line 
% histroy. In case of script it will only store the outputs appearning on
% the command line window. In case you run the commands on the command
% window then everything is being stored. Subsequent runs on the same diary
% will append the stuff to existing diary 

% A good usecase would be to start a diary at the startup and then close it
% at finish and add a time stamp wtih the it so that later on you can review it 

% Start recording to a new diary file
diary new_diary_1

% Turn on the diary recording
diary on

% Your MATLAB commands
a = [5 4 6 9];
b = sort(a);

% Turn off the diary recording
diary off

% Display the contents of the diary file
type new_diary_1