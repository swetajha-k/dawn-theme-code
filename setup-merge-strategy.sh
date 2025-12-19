#!/bin/bash
# Setup script to configure JSON merge strategy for store-stage branch
# This keeps store-stage's JSON files and ignores incoming changes

echo "Configuring Git merge strategy for JSON files..."

# Configure the 'ours' merge driver to keep the current version
git config merge.ours.driver "true"
git config merge.ours.name "Keep ours merge strategy"

echo "✓ Merge strategy configured successfully!"
echo ""
echo "This means when you merge PRs into store-stage:"
echo "  - JSON file conflicts will automatically keep store-stage's version"
echo "  - Code files will merge normally"
echo ""
echo "All team members need to run this script once in their local repo."
