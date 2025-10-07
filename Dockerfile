FROM linuxserver/ffmpeg:amd64-latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get install -y --no-install-recommends software-properties-common && \
  add-apt-repository multiverse && \
  apt-get purge -y software-properties-common && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends --allow-downgrades \
    libgstrtspserver-1.0-0 libgstreamer1.0-0 libgstreamer-plugins-bad1.0-0 \
    gstreamer1.0-x gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-tools \
    libcairo2 wget unzip tini jq alsa-plugins-pulse font-droid \
    python3 xserver-xorg-video-intel intel-media-va-driver-non-free \
    intel-gpu-tools libnvidia-decode libnvidia-encode mesa-va-drivers \
    libasound2-plugins && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/QuantumEntangledAndy/neolink/releases/download/v0.6.2/neolink_linux_x86_64_bullseye.zip && \
  unzip neolink_linux_x86_64_bullseye.zip && \
  mv neolink_linux_x86_64_bullseye/* /usr/local/bin/ && \
  rm -rf neolink_linux_x86_64_bullseye.zip neolink_linux_x86_64_bullseye && \
  wget -O /usr/local/bin/go2rtc https://github.com/AlexxIT/go2rtc/releases/latest/download/go2rtc_linux_amd64 && \
  chmod +x /usr/local/bin/go2rtc
