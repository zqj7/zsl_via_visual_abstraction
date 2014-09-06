%FILTEROUTTASKS Removes specified 'scenes' from 'tasks' data.
%  tasks = FilterOutTasks(allTasks, label) creates a
%  new struct arrays that only have the 'scenes' asked for.
%
%  INPUT
%    -allTasks:     Struct array containing all HIT tasks. 
%                   Should be generated by the ParseMTurk function.
%    -labels:       Array of strings containing which assignmentstatus
%                   you want (i.e., 'Submitted', 'Accepted', 'Rejected').
%  OUTPUT
%     -tasks:      Struct array containing all HIT tasks that have a 
%                  valid status (from labels).
%
%  Author: Stanislaw Antol (santol@vt.edu)                 Date: 2014-08-18

function tasks = FilterOutTasks(allTasks, labels)
    
    assignments = extractfield(allTasks, 'assignmentstatus');
    if ( iscell(labels) )
        validIdxs = false(length(assignments), 1);
        for i = 1:length(labels)
            validIdxs = validIdxs | strcmp(assignments, labels{i})';
        end
    else
        validIdxs = strcmp(assignments, labels);
    end
    tasks = allTasks(validIdxs);

end