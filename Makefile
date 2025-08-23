bef = MP4
aft = mp4
vcodec = "libx264"
acodec = "aac"
resize = "iw/2:ih/2"
output_dir = "converted"
vbitrate = "12000K"
abitrate = "320K"
src = $(wildcard *.$(bef))
dst = $(patsubst %.$(bef), ./$(output_dir)/%.$(aft), $(src))
FFMPEG = ffmpeg

all: $(dst) ./$(output_dir)
./$(output_dir)/%.$(aft): %.$(bef) $(output_dir)
	$(FFMPEG) -i $< -c:v $(vcodec) -c:a $(acodec) -b:v $(vbitrate) -b:a $(abitrate) -vf scale=$(resize) -ac 2 -loglevel error -n $@
./$(output_dir):
	-mkdir ./$(output_dir)

.PHONY: clean
clean:
	rm -r ./$(output_dir)
	

