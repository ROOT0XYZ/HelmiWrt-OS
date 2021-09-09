#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Add luci-app-ssr-plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../lean/luci-app-kodexplorer

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-diskman
git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
rm -rf ../lean/luci-app-docker
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-app-wrtbwmon
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wrtbwmon
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/wrtbwmon
rm -rf ../lean/luci-app-wrtbwmon

# Add luci-app-unblockneteasemusic
git clone --depth=1 https://github.com/immortalwrt/luci-app-unblockneteasemusic
rm -rf ../lean/luci-app-unblockmusic

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

#-----------------------------------------------------------------------------
#   Start of @helmiau additionals packages for cloning repo 
#-----------------------------------------------------------------------------

# Add luci-proto-modemmanager
# git clone --depth=1 https://github.com/nickberry17/luci-proto-modemmanager.git #For OpenWrt 18.xx and below only. 
# git clone --depth=1 https://github.com/rickydee/luci-proto-modemmanager.git #For OpenWrt 19.xx and above only.
# git clone --depth=1 https://github.com/helmiau/luci-proto-modemmanager.git #For OpenWrt snapshot.
# luci-proto-modemmanager has been through hook-feeds.sh

# Add modeminfo
git clone --depth=1 https://github.com/koshev-msk/luci-app-modeminfo

# Add luci-app-smstools3
git clone --depth=1 https://github.com/koshev-msk/luci-app-smstools3

# Add luci-app-mmconfig : configure modem cellular bands via mmcli utility
git clone --depth=1 https://github.com/koshev-msk/luci-app-mmconfig

# Add 3ginfo, luci-app-3ginfo
git clone --depth=1 https://github.com/4IceG/luci-app-3ginfo

# Add luci-app-sms-tool
git clone --depth=1 https://github.com/4IceG/luci-app-sms-tool

# Add luci-app-atinout-mod
git clone --depth=1 https://github.com/4IceG/luci-app-atinout-mod

# Add luci-app-cpu-status
git clone --depth=1 https://github.com/gSpotx2f/luci-app-cpu-status

# Add luci-app-internet-detector
git clone --depth=1 https://github.com/4IceG/luci-app-internet-detector

# HelmiWrt packages
git clone --depth=1 https://github.com/helmiau/helmiwrt-packages

# Add themes from kenzok8 openwrt-packages
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new kenzok8/luci-theme-atmaterial_new
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-edge kenzok8/luci-theme-edge
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-ifit kenzok8/luci-theme-ifit
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentomato kenzok8/luci-theme-opentomato
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentomcat kenzok8/luci-theme-opentomcat
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentopd kenzok8/luci-theme-opentopd

#-----------------------------------------------------------------------------
#   End of @helmiau additionals packages for cloning repo 
#-----------------------------------------------------------------------------

# Add luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udp2raw
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udpspeeder-tunnel

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Add luci-app-oled (R2S Only)
git clone --depth=1 https://github.com/NateLol/luci-app-oled

# Add extra wireless drivers
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8812au-ac
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8821cu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8188eu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8192du
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl88x2bu

popd

# Mod zzz-default-settings for HelmiWrt
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
sed -i '/18.06/d' zzz-default-settings
export orig_version=$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
export date_version=$(date -d "$(rdate -n -4 -p ntp.aliyun.com)" +'%Y-%m-%d')
sed -i "s/${orig_version}/${orig_version} ${date_version}/g" zzz-default-settings
sed -i "s/zh_cn/auto/g" zzz-default-settings
sed -i "s/uci set system.@system[0].timezone=CST-8/uci set system.@system[0].hostname=HelmiWrt\nuci set system.@system[0].timezone=WIB-7/g" zzz-default-settings
sed -i "s/Shanghai/Jakarta/g" zzz-default-settings
popd

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots' syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

#-----------------------------------------------------------------------------
#   Start of @helmiau terminal scripts additionals menu
#-----------------------------------------------------------------------------

# Add speedtest
wget -O package/base-files/files/bin/speedtest "https://raw.githubusercontent.com/vitoharhari/speedtest/main/speedtest" && chmod +x package/base-files/files/bin/speedtest

# Add vmess creator account from racevpn.com
# run "vmess" using terminal to create free vmess account
wget -O package/base-files/files/bin/vmess "https://raw.githubusercontent.com/ryanfauzi1/vmesscreator/main/vmess" && chmod +x package/base-files/files/bin/vmess

# Add ram checker from wegare123
# run "ram" using terminal to check ram usage
wget -O package/base-files/files/bin/ram "https://raw.githubusercontent.com/wegare123/ram/main/ram.sh" && chmod +x package/base-files/files/bin/ram

# Add fix download file.php for xderm and libernet
# run "fixphp" using terminal for use
wget -O package/base-files/files/bin/fixphp "https://raw.githubusercontent.com/helmiau/openwrt-config/main/fix-xderm-libernet-gui" && chmod +x package/base-files/files/bin/fixphp

#HelmiWrt Patches
mkdir -p "package/base-files/files/www/luci-static/helmiwrt"
wget --no-check-certificate $(curl -L https://github.com/helmiau/helmiau/releases/helmiwrt | grep "/helmiau/helmiau/releases/download" | grep ".svg" | sed -e 's/\"//g' -e 's/ //g' -e 's/rel=.*//g' -e 's#<ahref=#http://github.com#g') -P package/base-files/files/www/luci-static/helmiwrt/

# Preinstalled v2rayA web GUI
ETCWEB="package/base-files/etc/v2raya/web"
V2RAYAWEBSRC="http://github.com/v2rayA/v2raya-web/archive/refs/heads/master.zip"
V2RAYAWEBZIP="package/base-files/root/v2rayweb.zip"
V2RAYAWEBEXT="package/base-files/root/v2raya-web-master"
function v2raya_web_helmiau() {
	echo -e "  Installing v2rayA Web GUI...."
	wget -qO $V2RAYAWEBZIP $V2RAYAWEBSRC
	#Check size, unzip file if size is not null
	if [[ -s $V2RAYAWEBZIP ]]; then
		#Check v2rayA web directory, delete recursive if exist
		if [[ -d $ETCWEB ]]; then
			echo -e "  v2rayA web path is exist, cleaning..."
			mkdir -p $ETCWEB
			rm -rf $ETCWEB || true
			echo -e "  v2rayA web path cleaned..."
		fi
		#Check v2raya-web-master directory, delete recursive if exist
		if [[ -d $V2RAYAWEBEXT ]]; then
			echo -e "  Older v2raya-web-master directory is exist, cleaning..."
			rm -rf $V2RAYAWEBEXT || true
			echo -e "  Older v2raya-web-master cleaned..."
		fi
		echo -e "  Extracting files...."
		sleep 2
		unzip -q $V2RAYAWEBZIP
		sleep 2
		rm -f $V2RAYAWEBZIP || true
		echo -e "  Extract done...."
		echo -e "  Moving files...."
		mkdir -p package/base-files/etc/v2raya
		mv $V2RAYAWEBEXT $ETCWEB
		echo -e "  Moving done...."
		echo -e "  v2rayA Web GUI installed...."
	else
		echo -e "  v2rayA Web GUI install failed...."
	fi
	echo -e "======================================================"
}
v2raya_web_helmiau

#-----------------------------------------------------------------------------
#   End of @helmiau terminal scripts additionals menu
#-----------------------------------------------------------------------------
