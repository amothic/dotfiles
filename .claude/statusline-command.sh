#!/bin/bash

# JSON入力を一度読み込む
input=$(cat)

# 一般的な抽出用のヘルパー関数
get_model_name() { echo "$input" | jq -r '.model.display_name // "unknown"'; }
get_current_dir() { echo "$input" | jq -r '.workspace.current_dir'; }
get_transcript_path() { echo "$input" | jq -r '.transcript_path // ""'; }

# トークン使用量を計算するヘルパー関数
get_tokens_used() {
  local system_overhead=20000
  local autocompact_buffer=45000
  local message_tokens=0
  local transcript_path
  transcript_path=$(get_transcript_path)

  if [ -n "$transcript_path" ] && [ -f "$transcript_path" ]; then
    # 最後のusageを持つメッセージをjqで取得し、トークン合計を計算
    message_tokens=$(tail -50 "$transcript_path" 2>/dev/null | \
      jq -s '[.[] | select(.message.usage)] | last | .message.usage // {} |
        ((.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0) + (.output_tokens // 0))' 2>/dev/null || echo 0)
  fi

  # セッション開始時、message_tokensが0の場合はsystem_overheadを加算
  if [ "$message_tokens" -eq 0 ]; then
    echo $((system_overhead + autocompact_buffer))
  else
    echo $((message_tokens + autocompact_buffer))
  fi
}

# コンテキスト使用率を計算するヘルパー関数
get_usage_percent() {
  local tokens_used=$1
  local context_limit=200000

  if [ "$context_limit" -gt 0 ]; then
    echo $((tokens_used * 100 / context_limit))
  else
    echo 0
  fi
}

# トークン数をk形式でフォーマットするヘルパー関数
format_tokens() {
  local tokens=$1
  local k_value

  k_value=$(echo "scale=1; $tokens / 1000" | bc)
  echo "${k_value}k"
}

# 使用率に応じたANSIカラーコードを取得するヘルパー関数
get_context_color() {
  local usage_percent=$1

  if [ "$usage_percent" -lt 70 ]; then
    echo "\033[32m"  # 緑
  elif [ "$usage_percent" -lt 90 ]; then
    echo "\033[33m"  # 黄
  else
    echo "\033[31m"  # 赤
  fi
}

# Gitブランチを取得するヘルパー関数
get_git_branch() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return
  fi

  git branch --show-current 2>/dev/null
}

# ヘルパーを使用して最終出力用の変数を設定
MODEL=$(get_model_name)
CURRENT_DIR=$(get_current_dir)
tokens_used=$(get_tokens_used)
TOKENS_DISPLAY=$(format_tokens "$tokens_used")
USAGE_PERCENT=$(get_usage_percent "$tokens_used")
CONTEXT_COLOR=$(get_context_color "$USAGE_PERCENT")
RESET="\033[39m"
CYAN="\033[36m"
MAGENTA="\033[35m"
GIT_BRANCH=$(get_git_branch)

# 出力を構築
DIR_DISPLAY="${CYAN} ${CURRENT_DIR##*/}${RESET}"
if [ -n "$GIT_BRANCH" ]; then
  DIR_DISPLAY="$DIR_DISPLAY (${MAGENTA}$GIT_BRANCH${RESET})"
fi

OUTPUT="[$MODEL] $DIR_DISPLAY | $TOKENS_DISPLAY (${CONTEXT_COLOR}${USAGE_PERCENT}%${RESET})"
echo -e "$OUTPUT"
