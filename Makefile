bef = "mkv"
aft = "mp4"
vcodec = "libx264"
acodec = "aac"
resize = "1920:1080"
src = $(wildcard *.${bef})
dst = $(patsubst *.${bef}, *.${aft}, $(src))
all = $(dst)

./converted/%.${aft}: %.${bef}
	mkdir -p ./converted
	ffmpeg -i $< -c:v ${vcodec} -c:a ${acodec} -vf scale=${resize} -ac 2 $@

.PHONY: clean
clean:
	-rm -f ./converted/*.${aft}
	-rmdir ./converted