# Batch Video Converter
## Introduction
A Makefile-based batch video converter that uses ffmpeg to convert all video files to a specified format, and it can be used to process multiple videos parallelly. This project is designed to run on Linux systems.
## Usage
1. You just need to upload your videos to the folder.  
2. Modify the Makefile to set the necessary parameters. 
    - `vcodec`: The video codec you want to use for conversion (e.g., libx264, libx265, h264_nvenc).
    - `acodec`: The audio codec you want to use for conversion (e.g., aac, mp3).
    - `bef`: The input file extension (e.g., mp4, mkv).
    - `aft`: The output file extension (e.g., mp4, mkv).
    - `resize`: Set the resolution for the output videos (e.g., 1280:720, 1920:1080).
    - `output_dir`: The directory where the converted videos will be saved.
    - `vbitrate`: The video bitrate for the output videos (e.g., 1000k, 2000k).
    - `abitrate`: The audio bitrate for the output videos (e.g., 128k, 256k).
3. Run the following command in the terminal:
   ```bash
   make
   ```
   This will convert all the video one by one, and it can save the files in the output folder.  
   If you want to converting in parallel processes, you can use the command:
   ```bash
   make -j <number_of_jobs>
   ```
   Replace `<number_of_jobs>` with the number of parallel jobs you want to run.  
   If you want to use the GPU for conversion, you can modify the `vcodec` variable in the Makefile to a GPU-accelerated codec (e.g., `h264_nvenc` for NVIDIA GPUs). For more detials, please refer to the [FFmpeg Documentations.](https://ffmpeg.org/documentation.html)
4. After the conversion is complete, you can find the converted videos in the output directory called `converted`.
5. If you want to clean up the output directory, you can run:
   ```bash
   make clean
   ```
   This will remove all files in the `converted` directory. 
## Requirements
- `FFmpeg` installed on your system.
- `make` utility installed on your system.

## Notice
1. Please make sure that your input files can't be included with the space or special characters in the file names. Before the upload, you can rename the files to avoid any issues.