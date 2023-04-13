# golangci-conf
Config for golangci-lint with a simple makefile.

Useful links:

https://blog.ildarkarymov.ru/posts/linters/

https://golangci-lint.run

To use pre-commit hook:
1. open the directory .git/hooks
2. create a file named "pre-commit" 
3. open the file and insert following script:
```
#!/bin/bash

set -e

PROJECT_DIR="$(git rev-parse --show-toplevel)"
PROJECT_BIN="$PROJECT_DIR/backend/bin"

GOLANGCI_LINT="$PROJECT_BIN/golangci-lint"

# Exit if golangci-lint is not installed
if [ ! -f "$GOLANGCI_LINT" ]; then
    echo "golangci-lint is not installed. Please run 'make lint' first."
    exit 1
fi

cd "$PROJECT_DIR/backend" && "$GOLANGCI_LINT" run --config=./.golangci.yaml
```
4. make the pre-commit file executable by running "chmod +x pre-commit"
After completing theese steps, it will work successfully, and if the linter detect errors, commit will not be allowed. 
