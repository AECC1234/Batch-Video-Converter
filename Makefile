bef = MP4
aft = mkv
vcodec = "libx264"
acodec = "aac"
resize = "1920:1080"
src = $(wildcard *.$(bef))
dst = $(patsubst %.$(bef), ./converted/%.$(aft), $(src))

all: $(dst)
./converted/%.$(aft): %.$(bef)
	ffmpeg -i $< -c:v $(vcodec) -c:a $(acodec) -vf scale=$(resize) -ac 2 $@

.PHONY: clean
clean:
	-rm -f ./converted/*.$(aft)

print-vars:
	@echo "bef变量值: [$(bef)]"  # 确认bef是否为"mp4"（无引号、无空格）
	@echo "src变量值: [$(src)]"  # 确认是否匹配到.mp4文件
	@echo "dst变量值: [$(dst)]"  # 确认是否生成具体的./converted/xxx.mkv路径
