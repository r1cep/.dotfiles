#!/bin/bash

# ユニバーサル通知スクリプト
# 環境を自動検出してappropriateな通知方法を使用
# Usage: ./notify.sh <notification_type> [custom_message]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 環境検出関数
detect_environment() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif grep -qi microsoft /proc/version 2>/dev/null; then
        echo "wsl2"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # WSL2でない通常のLinux環境
        echo "linux"
    else
        echo "unknown"
    fi
}

# 通知関数
send_notification() {
    local notification_type="$1"
    local custom_message="$2"
    local env=$(detect_environment)

    case "$env" in
        "macos")
            "$SCRIPT_DIR/macos.sh" "$notification_type" "$custom_message"
            ;;
        "wsl2")
            "$SCRIPT_DIR/wsl2.sh" "$notification_type" "$custom_message"
            ;;
        "linux")
            # 通常のLinux環境では簡単なログ出力のみ
            echo "$(date '+%Y-%m-%d %H:%M:%S'): [$notification_type] ${custom_message:-'通知'}" >> "$XDG_DATA_HOME/claude/notifications.log"
            echo "通知: [$notification_type] ${custom_message:-'通知'}"
            ;;
        *)
            echo "未対応の環境です: $OSTYPE"
            echo "$(date '+%Y-%m-%d %H:%M:%S'): [$notification_type] ${custom_message:-'通知'} (未対応環境)" >> "$XDG_DATA_HOME/claude/notifications.log"
            ;;
    esac
}

# Claude Code用の便利関数
claude_confirm() {
    local message="${1:-確認が必要です}"
    send_notification "confirmation_required" "$message"
    echo "🤖 Claude: $message"
    echo "続行しますか？ (y/n): "
}

claude_completed() {
    local message="${1:-作業が完了しました}"
    send_notification "task_completed" "$message"
    echo "✅ Claude: $message"
}

claude_error() {
    local message="${1:-エラーが発生しました}"
    send_notification "error_occurred" "$message"
    echo "❌ Claude: $message"
}

claude_progress() {
    local message="${1:-進捗更新}"
    send_notification "progress_update" "$message"
    echo "📋 Claude: $message"
}

# メイン処理
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <notification_type> [custom_message]"
    echo "Available types: confirmation_required, task_completed, error_occurred, progress_update"
    echo ""
    echo "Convenience functions:"
    echo "  source $0  # Load functions into shell"
    echo "  claude_confirm [message]"
    echo "  claude_completed [message]"
    echo "  claude_error [message]"
    echo "  claude_progress [message]"
    echo ""
    echo "Current environment: $(detect_environment)"
    exit 1
fi

send_notification "$1" "$2"
