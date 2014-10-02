function k = getKeyboardNumber(deviceName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Given the name of device (e.g., Curtis, Recca, 3T), 
% determine keyboard number based on product/vendor ID
%
% Requires PsychToolbox
%
% Example useage:
% > S.keyboard_num = getKeyboardNumber('curtis');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Determine product ID based on device
switch deviceName
	case 'curtis'
		productID = 594;
	case 'recca'
		version_num = 112;
		productID = 594;
	case 'wendyo'
		version_num = 119;
	case '7T'
		vendorID = 1523;
	case '3T'
		productID = 612;
    case 'sgagnon-desktop'
        version_num = 116;

%% Figure out device's keyboard number
d=PsychHID('Devices');
k = 0;

for n = 1:length(d)
	if strcmp(d(n).usageName,'Keyboard')
		if exist(version_num)
			if d(n).version==version_num
				k = n;
        		break
        elseif exist(vendorID)
        	if d(n).vendorID==vendorID
				k = n;
        		break
        elseif exist(productID)
        	if d(n).productID==productID
				k = n;
        		break		
        end
	end 		

%% Print error if nothing matches
if k == 0
	fprintf(['Button box/Keyboard NOT FOUND!']);
end