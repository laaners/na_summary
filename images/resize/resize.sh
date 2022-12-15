for file in *.png;
do
    echo $file
    echo ffmpeg -y -hide_banner -i "$file"  "../$file"
    ffmpeg -n -hide_banner -i "$file" -c:v mjpeg  "../$file"
done
