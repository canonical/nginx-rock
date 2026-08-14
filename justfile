set allow-duplicate-recipes
set allow-duplicate-variables
import? 'rocks.just'

source_repo := 'nginx/nginx'

[private]
@default:
  just --list
  echo ""
  echo "For help with a specific recipe, run: just --usage <recipe>"
