# Commit changes on a separate branch
BRANCH_NAME=$(date +'%Y%m%d')

(cd $HOME/dotfiles && \
  if git show-ref --quiet refs/heads/$BRANCH_NAME; then \
    git checkout $BRANCH_NAME; \
  else \
    git checkout -b $BRANCH_NAME; \
  fi && \
  if git status --porcelain | grep -q '^[MADRC]'; then \
    git add -A && \
    git status --porcelain | awk '{print $2}' | xargs -I{} echo "Changed: {}" && \
    git commit -m "Update via backup: $(date +'%Y-%m-%d %H:%M:%S')" && \
    git checkout main && \
    echo "Changes committed to branch [$BRANCH_NAME]"; \
  else \
    echo "No changes to commit"; \
  fi)
