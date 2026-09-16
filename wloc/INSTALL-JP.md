# WLOC v1.1.0 / Shadowrocket 簡単インストール

このセットはSourceForgeの `apple-wloc.mirror` v1.1.0（元プロジェクトの2026-08-08コミット `ecd4992a7c92b7d6e92eb80b948eba54202ab85a`）を基準にしています。

## 1. Shadowrocketにモジュールを追加
Shadowrocket → 配置（Config）→ モジュール（Modules）→ 右上の＋ → URLから追加。

追加URL:
https://raw.githubusercontent.com/atsu6/elmbmi3/wloc-installer/wloc/WLOC-SourceForge-v1.1.0-Shadowrocket.module

追加後、Apple WLOC モジュールをONにします。

## 2. HTTPS復号をON
Shadowrocket → 配置 → 使用中設定のⓘ → HTTPS Decryption / HTTPS 解密。
CA証明書を生成してiPhoneへインストールします。

iPhone設定 → 一般 → VPNとデバイス管理 → Shadowrocketの証明書をインストール。
その後、設定 → 一般 → 情報 → 証明書信頼設定 → Shadowrocket CAを「完全に信頼」ON。

## 3. ショートカットを追加
位置を設定:
https://www.icloud.com/shortcuts/a82717d8fdad4e6280866fcf911173f7

位置を元に戻す:
https://www.icloud.com/shortcuts/f42632d406504f24a2cd163af4fe012f

## 4. 位置を変更
1. ShadowrocketのVPN接続をON。
2. Appleマップで移動したい場所を長押し。
3. 共有 → `wloc 设置地理位置`。
4. 位置情報サービスをOFF→ON。
5. 変わらない場合はiPhoneを再起動。
6. Appleマップや天気アプリで現在地を確認。

## 元に戻す
`wloc 清理恢复位置` を実行 → WLOCモジュールをOFF → 必要ならiPhoneを再起動。
使わない場合はShadowrocket CAの「完全に信頼」もOFFにしてください。

## 注意
この方式はAppleのネットワーク測位レスポンスを書き換えるもので、GPSチップ自体、IPアドレス、SIM国、Apple ID地域を変更するものではありません。
