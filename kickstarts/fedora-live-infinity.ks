%include fedora-live-workstation.ks

repo --name=irepo --baseurl=file:///home/ryangilland/Projects/irepo

%packages
gnome-control-center
-@ LibreOffice
%end
