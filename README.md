# Apple Watch Drawing App

Apple Watch用のお絵描きアプリ - SwiftUI製

![Platform](https://img.shields.io/badge/platform-watchOS%209.0%2B-blue)
![Language](https://img.shields.io/badge/language-Swift%205.9-orange)
![Framework](https://img.shields.io/badge/framework-SwiftUI-green)

## 機能

- 🎨 直感的なタッチ描画
- 🌈 8色のカラーパレット
- 🗑️ ワンタップクリア機能
- ⏱️ Apple Watchに最適化されたUI
- 📱 コンパクトなインターフェース

## スクリーンショット

<!-- スクリーンショットを追加してください -->

## 技術仕様

- **プラットフォーム**: watchOS 9.0+
- **言語**: Swift 5.9
- **フレームワーク**: SwiftUI
- **パッケージマネージャー**: Swift Package Manager

## インストール方法

### 前提条件

- Xcode 15.0+
- watchOS 9.0+のデバイスまたはシミュレーター

### セットアップ手順

1. **リポジトリをクローン**
   ```bash
   git clone https://github.com/TK-0238/apple-watch-drawing-app.git
   cd apple-watch-drawing-app
   ```

2. **Xcodeでプロジェクトを開く**
   ```bash
   open Package.swift
   ```

3. **ビルドターゲットを選択**
   - Apple Watchシミュレーターまたは実機を選択

4. **ビルド・実行**
   - `Cmd + R` でアプリを実行

## 使用方法

1. **アプリ起動**
   - Apple Watchでアプリをタップ

2. **描画開始**
   - 「お絵描きを始める」ボタンをタップ

3. **色の変更**
   - 左上の色付き円をタップ
   - 好みの色を選択

4. **描画**
   - 画面をタッチしてドラッグ
   - タップで点を描画

5. **消去**
   - 「クリア」ボタンで全消去

## アーキテクチャ

### ファイル構成

```
Sources/
└── WatchDrawingApp/
    ├── WatchDrawingApp.swift    # メインアプリエントリポイント
    ├── ContentView.swift        # ホーム画面
    ├── DrawingView.swift        # 描画画面
    └── Info.plist             # アプリ設定
```

### 主要コンポーネント

- **WatchDrawingApp**: アプリのメインエントリポイント
- **ContentView**: ナビゲーションとホーム画面
- **DrawingView**: 描画機能とCanvas処理
- **ColorPickerView**: 色選択インターフェース
- **Line**: 描画ラインのデータモデル

## 開発者情報

### カスタマイズ

- **色の追加**: `ColorPickerView`の`colors`配列を修正
- **ブラシサイズ**: `DrawingView`の`lineWidth`パラメータを変更
- **UI調整**: SwiftUIのスタイル修飾子でカスタマイズ

### パフォーマンス最適化

- **メモリ効率**: 大量のポイントデータの管理に注意
- **バッテリー消費**: 高頻度の描画更新を最小限に
- **レスポンシブ**: タッチイベントの遅延を最小化

## トラブルシューティング

### よくある問題

**描画が正しく表示されない**
- Digital Crownの回転が干渉していないか確認
- アプリを再起動してみてください

**色が変わらない**
- カラーピッカーで色を選択後、新しい線を描いてください
- 既存の線の色は変更されません

**パフォーマンスが悪い**
- 多数のラインを描いた後はクリアしてください
- バックグラウンドアプリを閉じてください

## ライセンス

MIT License

## 貢献

Pull RequestやIssueの報告を歓迎します！

1. フォークしてください
2. 機能ブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add amazing feature'`)
4. ブランチにプッシュ (`git push origin feature/amazing-feature`)
5. Pull Requestを作成

## 更新履歴

### v1.0.0
- 初回リリース
- 基本的な描画機能
- カラーピッカー対応
- Apple Watch最適化UI