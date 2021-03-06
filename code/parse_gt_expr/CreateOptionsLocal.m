%<FUNCTIONNAME> <Function description.>
%
%  [<outputs>] = <FunctionName>(<inputs>) is for <description>.
%
%  INPUT
%    -<input1>:     <input1 description>
%    -<input2>:     <input2 description>
%
%  OUTPUT
%    -<output1>:    <output2 description>
%
%  Author: Stanislaw Antol (santol@vt.edu)                 Date: 2014-08-18

function options = CreateOptionsLocal(options)

    %% Toggle which function to run
    options.parseAMTFile    = 1;
    options.processExprData = 1;

    %% Specifying the directory structure for the data
    options.inputFolder  = options.foldersLocal{options.idxPARSEExpr}{options.idxDataInput};
    options.outputFolder = options.foldersLocal{options.idxPARSEExpr}{options.idxDataOutput};
    
    %% Specifying the input file (experiment specific-might need to change!)
    options.exprResults = options.filePARSEAMTExpr;
            
    %% Specifying the output MATLAB files for the parsed input (e.g., .results->.mat w/ struct)
    options.AMTFile             = fullfile(options.outputFolder, 'parsed_amt_data.mat');
    options.avgPoseExprFile = options.filePARSEavgPoseExpr;

    % This gets stripped from the AMT results file names
    options.imgBase = 'https://filebox.ece.vt.edu/~santol/cvmlp/pose_clipart/data/PARSEStick/';
    
end