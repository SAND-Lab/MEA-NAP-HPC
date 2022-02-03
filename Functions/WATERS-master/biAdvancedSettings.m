%% Advanced settings for batchInterface (only modify if you know what you are doing)
load params
FNames = fieldnames(params);
for i = 1:length(FNames)
    VN = char(FNames{i});
    eval(['Params.' VN '= params.' VN ';']);
end
clear params

% quick test change

Params.plotDetectionResults = 0;
Params.threshold_calculation_window = [0, 1.0];  % which part of the recording to do spike detection, 0 = start of recording, 0.5 = midway, 1 = end of recording
% params.absThresholds = {''};  % add absolute thresholds here
% params.subsample_time = [1, 60];  % which part of the recording to subsample for spike detection (In seconds)
% if unspecified, then uses the entire recording
Params.run_detection_in_chunks = 0; % whether to run wavelet detection in chunks (0: no, 1:yes)
Params.chunk_length = 60;  % in seconds, will be ignored if run_detection_in_chunks = 0

Params.multiplier = 3; % multiplier to use extracting spikes for wavelet (not for detection)

% HSBSCAN is currently not used (and multiple_templates is not used to
% simplify things)
% adding HDBSCAN path (please specify your own path to HDBSCAN)
% currentScriptPath = matlab.desktop.editor.getActiveFilename;
% currFolder = fileparts(currentScriptPath);
% addpath(genpath([currFolder, filesep, 'HDBSCAN']));

% Uncomment this if you want to use custom threshold from a particular file
% params.custom_threshold_file = load(fullfile(dataPath, 'results', ...
% 'Organoid 180518 slice 7 old MEA 3D stim recording 3_L_-0.3_spikes_threshold_ref.mat'));

Params.custom_threshold_method_name = {'thr4p5'};
Params.remove_artifacts = 0;
Params.minPeakThrMultiplier = -5;
Params.maxPeakThrMultiplier = -100;
Params.posPeakThrMultiplier = 15;

% Refractory period (for spike detection and adapting template) (ms)
Params.refPeriod = 0.2; 
Params.getTemplateRefPeriod = 2;

Params.nSpikes = 10000;
Params.multiple_templates = 0; % whether to get multiple templates to adapt (1: yes, 0: no)
Params.multi_template_method = 'amplitudeAndWidthAndSymmetry';  % options are PCA, spikeWidthAndAmplitude, or amplitudeAndWidthAndSymmetry
 
% Filtering low and high pass frequencies 
Params.filterLowPass = 600;
Params.filterHighPass = 8000;

if Params.filterHighPass > Params.fs / 2
    fprintf(['WARNING: high pass frequency specified is above \n ', ...
        'nyquist frequency for given sampling rate, reducing it \n ' ...
        sprintf('to a frequency of %.f \n', Params.fs/2-100)])
    Params.filterHighPass = Params.fs/2-100;
end 


option = 'list';