mv airplayserverinstall.sh ~
mv start.sh ~
rm README.md
cd
echo Welcome to PiPlay Easy setup
echo The process will now begin..
echo Updating...
sudo apt-get update && sudo apt-get upgrade
echo Installing libraries...
sudo apt-get install git libao-dev libssl-dev libcrypt-openssl-rsa-perl libio-socket-inet6-perl libwww-perl avahi-utils libmodule-build-perl
cd
echo Fetching Perl-Net-SDP..
git clone https://github.com/njh/perl-net-sdp.git perl-net-sdp
cd perl-net-sdp
echo Building...
perl Build.PL
sleep 8
sudo ./Build
sleep 5
sudo ./Build test
sleep 5
sudo ./Build install
sleep 10
cd
echo Fetching Shairport...
git clone https://github.com/hendrik82/shairport.git
cd shairport
echo Building...
make
sleep 15
echo Setting scripts...
cd
sudo chmod a+x start.sh
echo "Finished!!"
echo Just run ./start.sh to activate PiPlay.
sudo rmdir airplayserverinstall
sudo rm AirPlayServerInstall.sh
exit

