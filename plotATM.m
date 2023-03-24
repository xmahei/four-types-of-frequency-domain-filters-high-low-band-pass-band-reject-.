% Load the data from the file
load('r01_edfm.mat');

% Get the data from the first row
data = val(1, :);

% Set the sampling frequency to 1000 Hz
fs = 1000;

% Create a time vector with the same length as the data
t = (0:length(data)-1)/fs;

% Plot the original data against time
figure(1);
plot(t, data);
xlabel('Time (s)');
ylabel('ECG Amplitude (mV)');
title('Original ECG Signal');

% Apply high-pass filter with cutoff frequency of 5 Hz
data_high = highpass(data, 5, fs);
figure(2);
plot(t, data_high);
xlabel('Time (s)');
ylabel('ECG Amplitude (mV)');
title('ECG Signal with High-Pass Filter');

% Apply low-pass filter with cutoff frequency of 100 Hz
data_low = lowpass(data, 100, fs);
figure(3);
plot(t, data_low);
xlabel('Time (s)');
ylabel('ECG Amplitude (mV)');
title('ECG Signal with Low-Pass Filter');

% Apply band-pass filter with passband frequencies of 20 Hz and 50 Hz
data_bandpass = bandpass(data, [20 50], fs);
figure(4);
plot(t, data_bandpass);
xlabel('Time (s)');
ylabel('ECG Amplitude (mV)');
title('ECG Signal with Band-Pass Filter');

% Apply band-reject filter with stopband frequencies of 45 Hz and 55 Hz
data_bandreject = bandstop(data, [45 55], fs);
figure(5);
plot(t, data_bandreject);
xlabel('Time (s)');
ylabel('ECG Amplitude (mV)');
title('ECG Signal with Band-Reject Filter');

% Save each filtered signal to a separate file
save('data_high.mat', 'data_high');
save('data_low.mat', 'data_low');
save('data_bandpass.mat', 'data_bandpass');
save('data_bandreject.mat', 'data_bandreject');
