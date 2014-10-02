function k = getKeyboardNumber(deviceName)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Given the name of device (e.g., Curtis, Recca, 3T), 
% determine keyboard number based on product/vendor ID
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

switch deviceName
	case 'curtis'
		productID = 594;
	case 'recca'
		version_num = 112;
		productID = 594
	case 'wendyo'
		version_num = 119;
	case '7T'
		vendorID = 1523
	case '3T'

d=PsychHID('Devices');
k = 0;

for n = 1:length(d)
	if (strcmp(d(n).usageName,'Keyboard')) && (d(n).version==version_num); % laptop keyboard
        k = n;
        break
    end
end