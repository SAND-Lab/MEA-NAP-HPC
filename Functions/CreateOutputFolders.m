function [] = CreateOutputFolders(HomeDir, OutputDataFolder, Date, GrpNm, NewFNsuffix)
% this function creates the following output folder structure:
%
%   OutputData+Date
%       ExperimentMatFiles
%       1_SpikeDetection
%       2_NeuronalActivity
%       3_EdgeThresholdingCheck
%       4_NetworkActivity
% Parameters
% ----------
% HomeDir : 
% OutputDataFolder : 
% Date : 
% GrpNm : 
% Returns 
% -------
% None

%% make sure we start in the home directory
cd(OutputDataFolder)

%% check if directory without suffix does not exist
if ~exist (fullfile(OutputDataFolder, strcat('OutputData',Date)),'file')
    NewFNsuffix='';
end

%% create output folder
outputDataDateFolder= fullfile(OutputDataFolder, strcat('OutputData', Date,char(NewFNsuffix)));
assert(~exist(outputDataDateFolder, 'file'), [outputDataDateFolder ' already exists.']);
spikeDetectionFolder = fullfile(outputDataDateFolder, '1_SpikeDetection');
neuronalActivityFolder = fullfile(outputDataDateFolder, '2_NeuronalActivity');
disp(['Name of Output Data Folder: OutputData',Date,char(NewFNsuffix)]);

mkdir(strcat('OutputData',Date,char(NewFNsuffix)))
cd(strcat('OutputData',Date,char(NewFNsuffix)))
mkdir('ExperimentMatFiles')
mkdir('1_SpikeDetection')
cd('1_SpikeDetection')
mkdir('1A_SpikeDetectedData')
mkdir('1B_SpikeDetectionChecks')
cd('1B_SpikeDetectionChecks')
for i = 1:length(GrpNm)
    mkdir(char(GrpNm{i}))
end
cd(OutputDataFolder); cd(strcat('OutputData',Date,char(NewFNsuffix)));
mkdir('2_NeuronalActivity')
cd('2_NeuronalActivity')
mkdir('2A_IndividualNeuronalAnalysis')
cd('2A_IndividualNeuronalAnalysis')
for i = 1:length(GrpNm)
    mkdir(char(GrpNm{i}))
end
cd(OutputDataFolder); cd(strcat('OutputData',Date,char(NewFNsuffix))); cd('2_NeuronalActivity')
mkdir('2B_GroupComparisons')
cd('2B_GroupComparisons')
mkdir('1_NodeByGroup')
mkdir('2_NodeByAge')
mkdir('3_RecordingsByGroup')
cd('3_RecordingsByGroup')
mkdir('HalfViolinPlots')
mkdir('NotBoxPlots')
cd(OutputDataFolder); cd(strcat('OutputData',Date,char(NewFNsuffix))); 
cd('2_NeuronalActivity'); cd('2B_GroupComparisons')
mkdir('4_RecordingsByAge')
cd('4_RecordingsByAge')
mkdir('HalfViolinPlots')
mkdir('NotBoxPlots')
cd(OutputDataFolder)
cd(strcat('OutputData',Date,char(NewFNsuffix)))
mkdir('3_EdgeThresholdingCheck')
mkdir('4_NetworkActivity')
cd('4_NetworkActivity')
mkdir('4A_IndividualNetworkAnalysis')
cd('4A_IndividualNetworkAnalysis')
for i = 1:length(GrpNm)
    mkdir(char(GrpNm{i}))
end
cd(OutputDataFolder); cd(strcat('OutputData',Date,char(NewFNsuffix))); cd('4_NetworkActivity')
mkdir('4B_GroupComparisons')
cd('4B_GroupComparisons')
mkdir('1_NodeByGroup')
mkdir('2_NodeByAge')
mkdir('3_RecordingsByGroup')
cd('3_RecordingsByGroup')
mkdir('HalfViolinPlots')
mkdir('NotBoxPlots')
cd(OutputDataFolder); cd(strcat('OutputData',Date,char(NewFNsuffix))); 
cd('4_NetworkActivity'); cd('4B_GroupComparisons')
mkdir('4_RecordingsByAge')
cd('4_RecordingsByAge')
mkdir('HalfViolinPlots')
mkdir('NotBoxPlots')
cd(OutputDataFolder); cd(strcat('OutputData',Date,char(NewFNsuffix))); 
cd('4_NetworkActivity'); cd('4B_GroupComparisons')
mkdir('5_GraphMetricsByLag')
mkdir('6_NodeCartographyByLag')
cd(HomeDir)
addpath(genpath(fullfile(OutputDataFolder, strcat('OutputData',Date,char(NewFNsuffix)))))

end