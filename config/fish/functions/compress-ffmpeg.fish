function compress-ffmpeg
	set filename "$argv[1]"
	set rootname (echo $filename | sed 's/\.[^.]*$//')

	ffmpeg -i "$argv[1]" -vcodec libx265 -crf 28 "$rootname"-compressed.mp4
end
