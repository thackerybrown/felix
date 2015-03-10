function k = getKeyboardNumber(deviceName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Given the name of device (e.g., Curtis, Recca, 3T), 
% determine keyboard number based on productID, vendorID, or version number
%
% Requires PsychToolbox
%
% Example useage:
% > S.keyboard_num = getKeyboardNumber('curtis');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Determine product ID based on device
switch deviceName
    case 'Curtis'
		productID = 594;
    case 'Ari'
		version_num = 537;    
    case 'DN5246gh.SUNet'
		version_num = 548;   
	case 'recca'
		version_num = 112;
		productID = 594;
	case 'wendyo'
		version_num = 119;
	case '7T'
		vendorID = 1523;
	case '3T'
		productID = 612;
	case 'sgagnon-desktop.stanford.edu'
		version_num = 116;
    otherwise
        vendorID = 1452;    
end

%% Figure out device's keyboard number
d=PsychHID('Devices');
k = 0;

for n = 1:length(d)
    if strcmp(d(n).usageName,'Keyboard')
		if exist('version_num', 'var')
            if d(n).version==version_num
				k = n;
        		break;
            end
        elseif exist('vendorID', 'var')
        	if d(n).vendorID==vendorID
				k = n;
        		break;
            end
        elseif exist('productID', 'var')
            if d(n).productID==productID
				k = n;
        		break;	
            end
        end
    end
end

%% Print error if nothing matches
if k == 0
	fprintf(['Button box/keyboard for ', deviceName, ' NOT FOUND!']);
end
