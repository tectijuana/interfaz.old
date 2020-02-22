# FIX para usar el balenaEtcher, en macOS Catalina forzar la copia las SDCards

![](https://i.ytimg.com/vi/AQjBFP3LLuM/maxresdefault.jpg)

## Aplicando en Terminal para elevar permisos al esa app gratuita
```
sudo /Applications/balenaEtcher.app/Contents/MacOS/balenaEtcher
xattr -d com.apple.quarantine /Applications/balenaEtcher.app
```
