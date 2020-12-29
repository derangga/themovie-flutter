
echo "#########################################################"
echo "#                                                       #"
echo "#                 Sync all dependencies                 #"
echo "#                                                       #"
echo "#########################################################"
echo ""
cd core
flutter pub get

cd ../movie
flutter pub get

cd ../tv
flutter pub get

cd ../person
flutter pub get

cd ..
flutter pub get

echo "All dependencies sync done"