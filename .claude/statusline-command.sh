#!/bin/bash

input=$(cat)

# モデル名
model=$(echo "$input" | jq -r '.model.display_name // "unknown"')

# 現在のディレクトリ
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
dir_name="${current_dir##*/}"

# コンテキスト使用量
tokens_used=$(echo "$input" | jq -r '.context.tokens_used // 0')
tokens_remaining=$(echo "$input" | jq -r '.context.tokens_remaining // 0')

tokens_total=$((tokens_used + tokens_remaining))
if [ "$tokens_total" -gt 0 ]; then
  usage_percent=$((tokens_used * 100 / tokens_total))
else
  usage_percent=0
fi

if [ "$usage_percent" -lt 70 ]; then
  context_emoji="🟢"
elif [ "$usage_percent" -lt 90 ]; then
  context_emoji="🟡"
else
  context_emoji="🔴"
fi

# Gitブランチ
git_branch=""
if git -C "$current_dir" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$current_dir" branch --show-current 2>/dev/null)
  if [ -n "$branch" ]; then
    git_branch=" | 🌿 $branch"
  fi
fi

printf "[%s] 📁 %s | %s %d%%%s" "$model" "$dir_name" "$context_emoji" "$usage_percent" "$git_branch"
