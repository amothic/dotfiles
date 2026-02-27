#!/bin/bash
set -euo pipefail

# カラー定義
readonly COLOR_GREEN="\033[32m"
readonly COLOR_YELLOW="\033[33m"
readonly COLOR_RED="\033[31m"
readonly COLOR_CYAN="\033[36m"
readonly COLOR_MAGENTA="\033[35m"
readonly COLOR_RESET="\033[39m"

# =============================================================================
# JSON入力を一度読み込む
# =============================================================================
input=$(cat)

# =============================================================================
# ヘルパー関数
# =============================================================================

# 一般的な抽出用のヘルパー関数
get_model_name() { echo "$input" | jq -r '.model.display_name // "unknown"'; }
get_current_dir() { echo "$input" | jq -r '.workspace.current_dir'; }

get_tokens_used() {
  echo "$input" | jq '
    .context_window.current_usage // {} |
    ((.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0) + (.output_tokens // 0))
  ' 2>/dev/null || echo 0
}

get_usage_percent() {
  echo "$input" | jq '.context_window.used_percentage // 0 | floor' 2>/dev/null || echo 0
}

# トークン数をk形式でフォーマットするヘルパー関数
format_tokens() {
  local tokens=$1
  local integer_part=$((tokens / 1000))
  local decimal_part=$(( (tokens % 1000) / 100 ))
  echo "${integer_part}.${decimal_part}k"
}

# 使用率に応じたANSIカラーコードを取得するヘルパー関数
get_context_color() {
  local usage_percent=$1

  if [ "$usage_percent" -lt 70 ]; then
    echo "$COLOR_GREEN"
  elif [ "$usage_percent" -lt 90 ]; then
    echo "$COLOR_YELLOW"
  else
    echo "$COLOR_RED"
  fi
}

# Gitブランチを取得するヘルパー関数
get_git_branch() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return
  fi

  git branch --show-current 2>/dev/null
}

# =============================================================================
# メイン処理
# =============================================================================

# ヘルパーを使用して最終出力用の変数を設定
model=$(get_model_name)
current_dir=$(get_current_dir)
tokens_used=$(get_tokens_used)
tokens_display=$(format_tokens "$tokens_used")
usage_percent=$(get_usage_percent)
context_color=$(get_context_color "$usage_percent")
git_branch=$(get_git_branch)

# 出力を構築
dir_display="${COLOR_CYAN} ${current_dir##*/}${COLOR_RESET}"
if [ -n "$git_branch" ]; then
  dir_display="$dir_display (${COLOR_MAGENTA}$git_branch${COLOR_RESET})"
fi
usage_display="${context_color}${usage_percent}%${COLOR_RESET}"

output="[$model] $dir_display | $tokens_display ($usage_display)"
echo -e "$output"
