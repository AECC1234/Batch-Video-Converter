bef = MP4	#The video format before converting
aft = mkv	#The video format after converting
vcodec = "libx264"	#Video Codec
acodec = "aac"		#Audio Codec
resize = "1920:1080"	#Resolution
src = $(wildcard *.$(bef))
dst = $(patsubst %.$(bef), ./converted/%.$(aft), $(src))
FFMPEG = ffmpeg		#The path to 'ffmpeg'

all: $(dst)
./converted/%.$(aft): %.$(bef)
	$(FFMPEG) -i $< -c:v $(vcodec) -c:a $(acodec) -vf scale=$(resize) -ac 2 -loglevel error $@

.PHONY: clean
clean:
	-rm -f ./converted/*.$(aft)

