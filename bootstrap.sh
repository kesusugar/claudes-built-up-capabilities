#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"

for skill_dir in "$REPO_DIR"/skills/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  dest="$SKILLS_DIR/$skill_name"
  mkdir -p "$dest"
  if [ -f "$skill_dir/SKILL.md" ]; then
    cp "$skill_dir/SKILL.md" "$dest/SKILL.md"
  fi
  if [ -f "$skill_dir/skill.yaml" ]; then
    cp "$skill_dir/skill.yaml" "$dest/skill.yaml"
  fi
  echo "[bootstrap] Installed: $skill_name"
done

echo "[bootstrap] Done."
