
echo "#########################################################"
echo "#                                                       #"
echo "#                 Generating dart code                  #"
echo "#                                                       #"
echo "#########################################################"
echo ""

cd movie/
echo "[INFO] Generating code in movie module..."
flutter packages pub run build_runner build --delete-conflicting-outputs

cd tv/
echo "[INFO] Generating code in tv module..."
flutter packages pub run build_runner build --delete-conflicting-outputs

cd ..
echo "[INFO] Generating code in app module..."
flutter packages pub run build_runner build --delete-conflicting-outputs

echo "[INFO] Generating dart code Complete..."