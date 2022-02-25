PREFIX_PATH=/home/ubuntu/FFmpeg/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/padding/lib/pkgconfig
LINKTO_PATH=/usr/share/pkgconfig

sudo rm ${LINKTO_PATH}/x264.pc
sudo rm ${LINKTO_PATH}/libavcodec.pc
sudo rm ${LINKTO_PATH}/libavdevice.pc
sudo rm ${LINKTO_PATH}/libavfilter.pc
sudo rm ${LINKTO_PATH}/libavformat.pc
sudo rm ${LINKTO_PATH}/libavutil.pc
sudo rm ${LINKTO_PATH}/libpostproc.pc
sudo rm ${LINKTO_PATH}/libswresample.pc
sudo rm ${LINKTO_PATH}/libswscale.pc

sudo ln -s /home/ubuntu/x264/install/lib/pkgconfig/x264.pc ${LINKTO_PATH}/x264.pc
sudo ln -s ${PREFIX_PATH}/libavcodec.pc                    ${LINKTO_PATH}/libavcodec.pc
sudo ln -s ${PREFIX_PATH}/libavdevice.pc                    ${LINKTO_PATH}/libavdevice.pc
sudo ln -s ${PREFIX_PATH}/libavfilter.pc                    ${LINKTO_PATH}/libavfilter.pc
sudo ln -s ${PREFIX_PATH}/libavformat.pc                    ${LINKTO_PATH}/libavformat.pc
sudo ln -s ${PREFIX_PATH}/libavutil.pc                      ${LINKTO_PATH}/libavutil.pc
sudo ln -s ${PREFIX_PATH}/libpostproc.pc                    ${LINKTO_PATH}/libpostproc.pc
sudo ln -s ${PREFIX_PATH}/libswresample.pc                  ${LINKTO_PATH}/libswresample.pc
sudo ln -s ${PREFIX_PATH}/libswscale.pc                     ${LINKTO_PATH}/libswscale.pc
