#!/bin/bash

# macOS用通知スクリプト
# Usage: ./macos.sh <notification_type> [custom_message]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/notifications.json"
LOG_FILE="$HOME/claude-notifications.log"

# 設定を読み込む関数
get_config() {
    local key="$1"
    python3 -c "
import json
import sys
try:
    with open('$CONFIG_FILE', 'r', encoding='utf-8') as f:
        config = json.load(f)
    result = config
    for k in '$key'.split('.'):
        result = result[k]
    print(result)
except:
    sys.exit(1)
"
}

# 通知を送信する関数
send_notification() {
    local notification_type="$1"
    local custom_message="$2"

    # メッセージを取得
    if [ -n "$custom_message" ]; then
        message="$custom_message"
    else
        message=$(get_config "notifications.$notification_type.message")
    fi

    # 音声の有無を確認
    sound_enabled=$(get_config "notifications.$notification_type.sound")

    # システム通知を送信
    osascript -e "display notification \"$message\" with title \"Claude Code\""

    # 音声通知を送信（必要に応じて）
    if [ "$sound_enabled" = "True" ] || [ "$sound_enabled" = "true" ]; then
        say "$message"
    fi

    # ログに記録
    echo "$(date '+%Y-%m-%d %H:%M:%S'): [$notification_type] $message" >> "$LOG_FILE"
}

# メイン処理
case "$1" in
    "confirmation_required")
        send_notification "confirmation_required" "$2"
        ;;
    "task_completed")
        send_notification "task_completed" "$2"
        ;;
    "error_occurred")
        send_notification "error_occurred" "$2"
        ;;
    "progress_update")
        send_notification "progress_update" "$2"
        ;;
    *)
        echo "Usage: $0 <confirmation_required|task_completed|error_occurred|progress_update> [custom_message]"
        exit 1
        ;;
esac
