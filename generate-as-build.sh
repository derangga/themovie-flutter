
echo "#########################################################"
echo "#                                                       #"
echo "#                 Generating dart code                  #"
echo "#                                                       #"
echo "#########################################################"
echo ""

cd movie/
echo "[INFO] Generating code in movie module..."
flutter packages pub run build_runner build

cd tv/
echo "[INFO] Generating code in tv module..."
flutter packages pub run build_runner build

cd ..
echo "[INFO] Generating code in app module..."
flutter packages pub run build_runner build

echo "[INFO] Generating dart code Complete..."