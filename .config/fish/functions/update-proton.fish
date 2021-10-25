function update-proton
	set url "https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest"
	set -xl response (curl -H "Authorization: token $GIT_TOKEN" -s $url)
	set -xl dl_url (echo $response | jq -r .assets[].browser_download_url | grep tar)
	set -xl proton_latest_ver (echo $response | jq -r .tag_name)
	set -xl proton_install_path "$HOME/.steam/root/compatibilitytools.d"


	if ls ~/.steam/root/compatibilitytools.d/ | grep -q "Proton-$proton_latest_ver";
		_proton-changelog
		echo "Already installed"
		_proton-remove-menu

	else
		_proton-changelog
		read -l -P "Do you want to update to Proton-$proton_latest_ver [Y/n]: " reply

		switch $reply

			case '' Y y
				echo "Downloading Proton-$proton_latest_ver"
				curl -L $dl_url | tar -xzf - -C ~/.steam/root/compatibilitytools.d/
				echo "Done"
				return 0

			case N n
				return 1

		end
	end

end

function _proton-changelog
	set updated_last (echo $response | jq -r .published_at)
	set updated_date (date --date=$updated_last +%d/%m/%y)
	set desc (echo $response | jq -r .body)

	echo "Version Description: "
	echo $desc \n
	echo "Latest version is:	Proton-$proton_latest_ver"
	echo "Last update was on:	$updated_date"
end

function _proton-remove-menu
	echo \nDo you want to:\n    1 - Remove all but latest version installed\n    2 - Remove all installed versions\n    0 - Do nothing [default]

	read -l -P "Reply: " reply

	switch $reply
		case 1
			echo "Removing all but latest installed version"
			cd $proton_install_path
			set -l files Proton-*
			for file in Proton-$proton_latest_ver
    			if set -l index (contains -i -- $file $files)
        			set -e files[$index]
    			end
			end
			rm -rf $files
			cd -
			echo "Done"

		case 2
			echo "Removing all custom proton installed"
			cd $proton_install_path
			rm -rf Proton-*
			cd -
			echo "Done"

		case '' 0
			echo "Exiting"

	end
end
