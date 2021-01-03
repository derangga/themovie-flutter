
echo "#########################################################"
echo "#                                                       #"
echo "#                 Clean build_runner                    #"
echo "#                                                       #"
echo "#########################################################"
echo ""
cd movie/
echo "[INFO] Clean generate code in movie module..."
flutter packages pub run build_runner clean

cd tv/
echo "[INFO] Clean generate code in tv module..."
flutter packages pub run build_runner clean

cd ..
echo "[INFO] Clean generate code in app module..."
flutter packages pub run build_runner clean

echo "[INFO] Clean generate dart code Complete..."