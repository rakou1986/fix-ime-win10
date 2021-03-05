# fix-ime-win10
つかいかた：
- reboot-ime.ps1 をどっかにおく
- reboot-ime.ps1 のショートカットを作成
- ショートカットを右クリックでプロパティを開く
- プロパティのタブ「ショートカット」の項目「リンク先」を以下にしてOK
```
powershell.exe -NoProfile -ExecutionPolicy RemoteSigned -File <reboot-ime.ps1のパス>
```
- ショートカットをどっか使いやすい場所に置く
- ショートカットを右クリックで「管理者として実行」
- PIDが変わったらOK（うまくいったときはこうなるスクリーンショット.pngを参照）
