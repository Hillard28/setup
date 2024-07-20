%include fedora-live-workstation.ks

%packages
# Packages excluded from @workstation-product-environment
-@libreoffice
# Packages excluded from @workstation-product
-rhythmbox
%end

