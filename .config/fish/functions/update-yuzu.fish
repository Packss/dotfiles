function update-yuzu
	set url "https://api.github.com/repos/yuzu-emu/yuzu-mainline/releases/latest"
	set response (curl -H "Authorization: token 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" -s $url)
	set dl_url (echo $response | jq -r .assets[0].browser_download_url | grep .AppImage)
	set -U latest_ver (echo $response | jq -r .assets[0].name)


	if ls ~/Applications/ | grep -q "$latest_ver";
		set updated_last (echo $response | jq -r .published_at)
		set updated_date (date --date=$updated_last +%d/%m/%y)
		set desc (echo $response | jq -r .body)

		echo "Version Description: "
		echo $desc \n
		echo "Latest version is:	$latest_ver"
		echo "Last update was on:	$updated_date"
		echo "Already installed"

	else
		read -l -P "Do you want to update to $latest_ver [Y/n]: " reply

		switch $reply

			case '' Y y
				echo "Downloading $latest_ver"
				cd $HOME/Applications
				rm yuzu.AppImage
				wget "$dl_url" -O yuzu.AppImage
				chmod +x yuzu.AppImage
				cd -
				echo "Done"
				return 0

			case N n
				return 1

		end
	end

end
