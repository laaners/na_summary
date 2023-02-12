for file in *.png;
do
    echo $file
    echo ffmpeg -y -hide_banner -i "$file"  "../$file"
    #ffmpeg -n -hide_banner -i "$file" -c:v mjpeg  "../$file"
    ffmpeg -y -hide_banner -i "$file" -c:v mjpeg -qscale:v 0 -crf 0 -pix_fmt rgba "../$file"
done

#	ffmpeg -y -hide_banner -i "%%f" -c:v mjpeg -qscale:v 0 -crf 0 -pix_fmt rgba "../%%f"
