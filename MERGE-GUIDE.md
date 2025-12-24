# Merging store-dev to store-stage (Excluding JSON Files)

## How It Works

This repository is configured to **automatically preserve store-stage's JSON files** when merging from store-dev. This means:
- ✅ All code changes from store-dev will be merged
- ❌ JSON files (configs, templates, sections, locales) will NOT be overwritten
- 🔒 store-stage's JSON files remain untouched

## One-Time Setup (For Each Developer)

Run this command once in your local repository:

```bash
git config --local merge.ours.driver true
git config --local merge.ours.name "Keep our version during merge"
```

## Manual Merge (Local)

When you want to manually merge store-dev to store-stage:

```bash
# Switch to store-stage
git checkout store-stage

# Pull latest changes
git pull origin store-stage

# Merge from store-dev (JSON files will be preserved automatically)
git merge store-dev -m "Merge store-dev to store-stage (preserving stage JSON)"

# Push to remote
git push origin store-stage
```

The `.gitattributes` file ensures JSON files keep the store-stage version automatically!

## Automatic Sync (GitHub Actions)

The workflow `.github/workflows/sync-stores.yml` automatically syncs changes:
- **Trigger**: When you push to store-dev
- **Action**: Merges store-dev → store-stage (excluding JSON)
- **Result**: Code synced, JSON preserved

## Files Protected

All files matching these patterns keep the store-stage version:
- `*.json`
- `config/*.json`
- `templates/**/*.json`
- `sections/*.json`
- `locales/*.json`

## Verification

After merging, you can verify JSON files weren't changed:

```bash
git diff HEAD~1 HEAD -- '*.json'
```

This should show no changes to JSON files.
