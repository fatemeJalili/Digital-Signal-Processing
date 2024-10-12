function [diameter] = diameterCalc(signal, fsample)
[r, lag] = xcorr(signal);
[~, locs] = findpeaks(r, 'SortStr', 'descend');
max_locations = locs(1:2);
lags = lag(max_locations);

delay = abs(lags(1) - lags(2));

velocity = 1500;

diameter = velocity * delay / (2 * fsample) ;

end