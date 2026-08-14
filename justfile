set allow-duplicate-recipes
set allow-duplicate-variables
import? 'rocks.just'

source_repo := 'nginx/nginx'

[private]
@default:
  just --list
  echo ""
  echo "For help with a specific recipe, run: just --usage <recipe>"


# Print "<version> <tag>" for the newest upstream release on a major.minor line
[private]
@resolve-tag major_minor:
  gh release list --repo {{source_repo}} --exclude-pre-releases --limit=200 --json tagName --jq '.[].tagName' \
    | while read -r t; do \
        v="${t#mimir-}"; v="${v#cmd/builder/v}"; v="${v#v}"; v="${v#release-}"; \
        [[ "$(echo "$v" | grep -oP '^\d+\.\d+')" == "{{major_minor}}" ]] && echo "$v $t"; \
      done \
    | sort -V | tail -n1
