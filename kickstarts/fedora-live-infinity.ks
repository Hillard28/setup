%include fedora-live-workstation.ks

%packages
# Packages excluded from @workstation-product-environment
-@libreoffice
-libreoffice-calc
-libreoffice-emailmerge
-libreoffice-graphicfilter
-libreoffice-impress
-libreoffice-writer
-libreoffice-base
-libreoffice-draw
-libreoffice-math
-libreoffice-pyuno
-unoconv
# Packages excluded from @workstation-product
-rhythmbox
%end

