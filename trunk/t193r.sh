#!/bin/bash
############################################################################
#                       COPYRIGHT t193r (2012)                             #
#     blusp10it | red-dragon | v10l3t | m0nst3r | mp1k | b0t4x | 'eko      #
############################################################################
# Script ini berfungsi untuk memanggil tiga script                         #
# yang dikembangkan oleh t193r (Komunitas BackTrack UNPAM)                 #
# Script ini memuat:                                                       #
# 1. WPA/WEP autocracker                  [weefee.sh]                      #
# 2. BackTrack 3rd party tools updater    [trigger.sh]                     #
# 3. Dictionary tools                     [deectee.sh]                     #
# 4. Security checker tools               [nakedsec.sh]                    #
############################################################################
# Gunakan secara BIJAK, pengembang TIDAK bertanggung jawab                 #
# dengan penggunaan script untuk merusak sistem                            #
############################################################################
# This program is free software: you can redistribute it and/or modify     #
# it under the terms of the GNU General Public License as published by     #
# the Free Software Foundation, either version 3 of the License, or        #
# (at your option) any later version.                                      #
#                                                                          #
# This program is distributed in the hope that it will be useful,          #
# but WITHOUT ANY WARRANTY; without even the implied warranty of           #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            #
# GNU General Public License for more details.                             #
#                                                                          #
# You should have received a copy of the GNU General Public License        #
# along with this program.  If not, see <http://www.gnu.org/licenses/>.    #
############################################################################

case $1 in
    --weefee|-w) wifi;;
   --wordlist|w) wordlist;;
    --update|-u) update;;
       --sec|-s) nakedsec;;
           --up) echo "Updating ..."; svn update; exit 0;;
esac

trap quit INT

wifi () {
   clear
   bash weefee/weefee.sh
}

update () {
   clear
   bash trigger/trigger.sh
}

wordlist () {
   clear
   bash wordlist/deectee.sh
}

nakedsec () {
   clear
   bash nakedsec/nakedsec.sh
}

quit () {
   if [ -e "index.html" ]; then
      rm -f index.html
   fi
   echo -e "Bye bye (="
   exit 0
}

while : ; do
   clear
   cat << BANNER
========================================
-- [C]rack or DoS an Access Point
-- [U]pdate persenjataan hacking
-- Membuat atau memodifikasi [W]ordlist
-- Check [S]ecurity
-- [./t193r.sh --up] update script ini
========================================
BANNER
   echo -n "       [Untuk keluar, pilih \"X\"]
========================================
What do you want today? "
   read choice
   case $choice in
      C|c) wifi ;;
      U|u) update ;;
      W|w) wordlist ;;
      S|s) nakedsec ;;
      X|x) quit ;;
      *) echo "Input error -> $choice! Coba lagi! Pilihan yang memungkinkan adalah C-U-W-S-X.
Skrip ini tidak case-sensitive"; sleep 2 ;;
   esac
done