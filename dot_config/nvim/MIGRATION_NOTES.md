# dein.vim から lazy.nvim への移行メモ

## 移行日時

2025-08-06

## 移行内容

### 旧構成（dein.vim）

- プラグインマネージャー: dein.vim
- 設定ファイル: init.vim
- プラグインリスト: .vim/dein.toml
- キャッシュ: ~/.cache/dein/

### 新構成（lazy.nvim）

- プラグインマネージャー: lazy.nvim
- 設定ファイル: init.lua
- プラグインリスト: lua/plugins/ 以下の個別ファイル
- プラグイン設定: lua/config/ 以下

### 移行されたプラグイン

1. tomasr/molokai - カラースキーム
2. vim-airline/vim-airline - ステータスライン
3. thinca/vim-quickrun - コード実行
4. mattn/emmet-vim - HTML/CSS補完
5. posva/vim-vue - Vue.js構文サポート
6. neoclide/coc.nvim - LSPサポート
7. wakatime/vim-wakatime - 開発時間トラッキング
8. nvim-treesitter/nvim-treesitter - 構文ハイライト
9. nvim-telescope/telescope.nvim - ファジーファインダー
10. nvim-telescope/telescope-fzf-native.nvim - Telescope FZF拡張
11. nvim-telescope/telescope-frecency.nvim - Telescope 頻度拡張
12. nvim-tree/nvim-web-devicons - アイコンサポート
13. nvim-lua/plenary.nvim - Telescope依存関係

### 注意事項

- 初回起動時、lazy.nvimが自動的にプラグインをインストールします
- CoC拡張機能は起動後に自動インストールされます
- TreeSitterパーサーは必要に応じて自動インストールされます
