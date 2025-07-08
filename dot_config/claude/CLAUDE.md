# CLAUDE.md

必ず日本語で回答してください。

このファイルは、このリポジトリのコードを扱う際のClaude Code (claude.ai/code) へのガイダンスを提供します。

## ツール

### ファイル探索

- ファイル探索には`find`コマンドではなく`fd`コマンドを使用してください
- `fd`コマンドのドキュメント: https://github.com/sharkdp/fd
- より高速で使いやすいファイル検索ツールです

## 通知設定

### Claude通知システム

`~/.claude/`ディレクトリに環境別の通知設定が配置されています。

#### 利用可能な通知タイプ

- **confirmation_required**: 確認が必要な場合（重要な変更前）
- **task_completed**: 作業完了時
- **error_occurred**: エラー発生時
- **progress_update**: 進捗更新時

#### 使用方法

```bash
# 基本的な使用方法
~/.config/claude/notify.sh confirmation_required "10ファイル以上の変更を行います"
~/.config/claude/notify.sh task_completed "リファクタリングが完了しました"

# 便利関数を使用（sourceして使用）
source .~/.config/claude/notify.sh
claude_confirm "続行しますか？"
claude_completed "作業完了"
claude_error "エラーが発生"
claude_progress "進捗報告"
```

#### 環境別対応

- **macOS**: システム通知 + 音声通知
- **WSL2**: Windows通知 + 音声通知
- **Linux**: ログ出力のみ

#### 確認が必要な場面（自動）

- 複数パッケージにわたる変更前
- 10ファイル以上の変更前
- セキュリティ関連の変更前
- API設計の変更前
- テストファイルの削除前
- 依存関係の追加・削除前
- ビルド設定の変更前

#### Claude Code での自動通知

私（Claude）が以下のような確認を求める際は、必ず通知システムを使用します：

```bash
~/.config/claude/notify.sh confirmation_required "確認メッセージ"
```

**自動通知が送られる場面：**

- 重要な変更や削除を行う前
- ユーザーの意図確認が必要な場合
- 複数の選択肢から選択を求める場合
- 作業完了時の報告
- エラーや問題が発生した場合

**使用例：**

- 「10ファイル以上の変更を行います。続行しますか？」
- 「APIの設計変更を検出しました。変更を適用しますか？」
- 「テストが失敗しました。修正しますか？」

#### ログ

すべての通知は `~/.config/claude/notifications.log` に記録されます。

## テスト

### テスト関数の使用

- `describe`, `it`は使用しない
- `test`関数を使用する

### テストユーティリティ

- `render`, `renderComponentWithRouter`, `screen`, `waitFor` は各パッケージの `test-utils.ts` を使用する
- 相対パスは各パッケージのtest-utils.tsxまでのパスを使用する（例：`../../../tests/test-utils`）

### Storybook テスト

- Storybookでは `storybook/test` の `expect` を使用する
- テストで `storybook/react-vite` の `composeStories` を使用して `storybook/test` パッケージの Portal Stories を再利用する
- play関数を使用してStorybookのStoryを実行する

#### composeStories の基本的な使用方法

```tsx
import { composeStories } from "@storybook/react-vite";
import { render, waitFor } from "../../../tests/test-utils"; // Relative path to test-utils.tsx
import * as stories from "./Component.stories";

const { Primary } = composeStories(stories);

test("renders and executes the play function", async () => {
  const { container } = render(<Primary />);

  // Mount story and run interactions
  await waitFor(async () => {
    await Primary.play?.({ canvasElement: container });
  });
});
```
