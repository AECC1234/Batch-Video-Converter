bef = MP4
aft = mkv
vcodec = "libx264"
acodec = "aac"
resize = "1920:1080"
output_dir = "converted"
vbitrate = "12000K"
abitrate = "320K"
src = $(wildcard *.$(bef))
dst = $(patsubst %.$(bef), ./$(output_dir)/%.$(aft), $(src))
FFMPEG = ffmpeg

all: $(dst) $(output_dir)
./$(output_dir)/%.$(aft): %.$(bef) $(output_dir)
	$(FFMPEG) -i $< -c:v $(vcodec) -c:a $(acodec) -b:v $(vbitrate) -b:a $(abitrate) -vf scale=$(resize) -ac 2 -loglevel info $@
./$(output_dir):
	-mkdir $(output_dir)

.PHONY: clean
clean:
	-rm -f ./$(output_dir)/*.$(aft)
	-rm -rf ./$(output_dir)

